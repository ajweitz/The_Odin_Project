class Response

	HTTP_STATUS = {404 => "Not Found",400 => "Bad Request", 200 => "OK", 500 => "Internal Server Error"}
	PROTOCOL = "HTTP/1.1"


	def initialize status, protocol, headers, body
		@protocol = protocol
		@code = status.to_s
		@status = HTTP_STATUS[status]
		@headers = headers
		@body = body
		
	end

	def self.build status, headers=[], body = "", protocol = PROTOCOL
		default_header = ["Date: " + Time.now.utc.strftime("%a, %d %b %Y %H:%M:%S GMT").to_s]
		headers = default_header + headers
		headers << "Content-Length: #{body.size}" if body.size > 0
		new status, protocol, headers, body
	end

	def to_s

		response = "#{@protocol} #{@code} #{@status}\n"
		@headers.each{ |h| response+= h + "\n" }
		response+= "\n"+@body
		response
	end

end