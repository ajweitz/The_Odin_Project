require_relative './response'
module Mapping

	FILES = 
		{
			"/index.html" => "./html/index.html", 
			"404" => "./html/404.html"
		}

	RESPONSE_NOT_FOUND = Response.build( 404, ["Content-Type:text/html"], File.read(FILES["404"]) )



end