require 'socket'	# Get sockets from stdlib
require_relative './request'
require_relative './response'
require_relative './mapping'

PORT = 2000

def controller(request, request_body)
	req = Request.parse_request(request)
	begin
		case req.http_method
		when "GET"
			if req.uri.include? "?"
				puts "Read values"
			else
				body = File.read(Mapping::FILES[req.uri])
				response = Response.build( 200, ["Content-Type:text/html"], body)
			end
		when "POST"
				
		end
	rescue Exception => e
		response = Mapping::RESPONSE_NOT_FOUND
	end	

	response.to_s
end




server = TCPServer.open(PORT)   # Socket to listen on port 2000
loop do                         # Servers run forever
	Thread.start(server.accept) do |client|
		request = ""
		loop do 
		 	input = client.gets.chomp
		 	if input.size == 0
				request+= "\n"
				break 
		 	end
			request+= input+"\n"
		end
		
		client.puts controller(request, client)
	  client.close                # Disconnect from the client
	end
end