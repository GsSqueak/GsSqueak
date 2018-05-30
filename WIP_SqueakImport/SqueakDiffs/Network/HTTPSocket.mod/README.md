HTTPSockets is a facade for handling common HTTP requests. It provides a minimal implementation of the HTTP protocol, but can be extended by third party clients that register themselves as #httpRequestHandler (see class-side protocol).

A third-party request handler needs to implement the single method

	#httpRequest:url:headers:content:response:

in a way that is compatible with the baseline implementation in HTTPSocket.
