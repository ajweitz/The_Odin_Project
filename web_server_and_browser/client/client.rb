require 'socket'
require 'json'
require_relative './request'
require_relative './response'

def send_request(request)
	port = request.port.to_s
	host = request.host.to_s

	socket = TCPSocket.open(host,port)  # Connect to server
	socket.print(request)               # Send request
	response = Response.parse_response(socket.read)  # Read complete response
	socket.close
	response
end

def send_get_request(address)
	response = send_request(Request.build(address))
	return send_get_request(response.header_value("Location").to_s) if response.code == "302"
	response
end

def send_post_request(address, body)
	send_request(Request.build(address,"POST",body))
end
 

puts "enter your name"
username = gets.chomp
puts "enter your email"
email = gets.chomp

puts send_post_request("localhost:2000/thanks",{viking:{name: username,email: email}}.to_json)

# print send_get_request("localhost:2000")
