

class Request

	attr_reader :http_method, :uri, :version, :headers, :body
	def initialize http_method, uri, version, headers, body
		@http_method = http_method.upcase
		@uri = uri
		@version = version
		@headers = headers
		@body = body
	end

	def self.parse_request(string)

		request = string.split("\n")
		request_line = request.shift.split(" ")
		http_method = request_line[0]
		uri = request_line[1]
		version = request_line[2]
		
		headers = 
			if request.include?("")
				request[0..request.find_index("")-1]
				body = (request - (headers +[""])).join("\n")
			else
				request
				body = ""
			end

		new http_method, uri, version, headers, body
	end

end