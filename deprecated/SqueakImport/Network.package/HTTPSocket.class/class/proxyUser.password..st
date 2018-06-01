proxy settings
proxyUser: userName password: password
	"Store  HTTP 1.0 basic authentication credentials
	Note: this is an ugly hack that stores your password
	in your image.  It's just enought to get you going
	if you use a firewall that requires authentication"
	| encoded |
	encoded := (userName, ':', password) base64Encoded.
	HTTPProxyCredentials := 'Proxy-Authorization: Basic ' , encoded, String crlf