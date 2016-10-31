class Response

	attr_reader :code

	def initialize http_version, code, status, headers, body, full_response
		@http_version = http_version
		@code = code
		@status = status
		@headers = headers
		@body = body
		@full_response = full_response
	end

	def self.parse_response(response)

		headers,body = response.split("\r\n\r\n", 2) 
		respone_line,headers = response.split("\r\n", 2)
		http_version,code,status = respone_line.split(" ",3)
		headers = headers.split("\r\n") 
		
		new http_version, code, status, headers, body, response
	end

	def header_value(key)
		@headers.each do |h| 
			k, value = h.split(" ",2)
			return value if k[0..-2].downcase == key.downcase
		end
		nil
	end

	def to_s
		@full_response
	end

end