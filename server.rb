require 'socket'

webserver = TCPServer.new('localhost', 2000)

while (session = webserver.accept)
  session.print "HTTP/1.1 200/OK\r\nContent-type:text/html\r\n\r\n"
  request = session.gets

  # For use index.html.erb just uncomment this lines bellow
  # trimmedrequest = request.gsub(/GET\ \//, '').gsub(/\ HTTP.*/, '')
  # filename = trimmedrequest.chomp
  # if filename == ""
  #   filename = "index.html.erb"
  # end
   
  begin
    # Comment this lines bellow for use index.html.erb
    session.puts(Time.now.ctime)
    session.puts("<br /><br />")
    session.puts("Closing connection on client.")
    session.close

    # For use index.html.erb just uncomment this lines bellow
    # displayfile = File.open(filename, 'r')
    # content = displayfile.read()
    # session.print content
  rescue Errno::ENOENT
    session.print "File not found"
  end

  session.close

end