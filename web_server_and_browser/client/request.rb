class Request

	HTTP_VERSION = "HTTP/1.0"

	attr_reader :host, :port

	def initialize path="/", http_method="GET", host="localhost", port="2000", headers=[], body=""
		@http_method = http_method
		@path = path
		@host = host
		@port = port
		@headers = headers
		@body = body
		
	end

	def self.build(address="localhost:2000/index.html", http_method="GET", body="")

		address.slice!(address.match(".*//").to_s) if address.include?("://") #remove http:// or https:// from the beggining

		if address.include? ":"
			host,port = address.split(":",2)	
			port = port.match('[0-9]*')
		else
			port = "80"
			host = address.include?("/") ? address.split("/")[0] : address
		end
		path = address.match('/.*')
		path = "/" if path == nil
		headers = ["Content-Length: #{body.size}"]
		new path, http_method, host, port, headers, body
	end

	def to_s
		request_line = "#{@http_method} #{@path} #{HTTP_VERSION}\r\n#{@headers.join("\r\n")}\r\n\r\n#{@body}"
	end


end