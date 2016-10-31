

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

		request = string.split("\r\n")
		request_line = request.shift.split(" ")
		http_method = request_line[0]
		uri = request_line[1]
		version = request_line[2]
		
	
		headers = 
			if request.include?("")
				request[0..request.find_index("")-1]
				body = (request - (headers +[""])).join("\r\n")
			else
				body = ""
				request
			end
			
		new http_method, uri, version, headers, body
	end

	def header_value(key)

		@headers.each do |h| 
			k, value = h.split(" ",2)
			return value if k[0..-2].downcase == key.downcase
		end
		nil
	end

end