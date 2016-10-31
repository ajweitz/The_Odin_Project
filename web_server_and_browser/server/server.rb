require 'socket'	# Get sockets from stdlib
require 'json'
require_relative './request'
require_relative './response'
require_relative './mapping'

PORT = 2000

def yield_html(body, json_values)
	params = {} 
	html_yield =""

	params = JSON.parse(json_values)
	puts params
	params.each do |key, val|
		val.each{|k,v| html_yield << "<li> #{k}: #{v}</li>" }
	end
	puts body
	puts body.gsub("<%= yield %>", html_yield)
	body.gsub("<%= yield %>", html_yield)
end

def controller(request, stream)
	req = Request.parse_request(request)
	request_body=""
	content_length = req.header_value("Content-Length")
	(content_length.to_i).times{request_body<<stream.getc} if content_length != nil && content_length != 0

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
			body = yield_html(File.read(Mapping::FILES[req.uri]),request_body)
			response = Response.build( 200, ["Content-Type:text/html"], body)
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
				request+= "\r\n"
				break 
		 	end
			request+= input+"\r\n"
		end

		client.puts controller(request, client)
	  client.close                # Disconnect from the client
	end
end