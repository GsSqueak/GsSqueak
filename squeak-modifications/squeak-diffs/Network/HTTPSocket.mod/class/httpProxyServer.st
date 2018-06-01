proxy settings
httpProxyServer
	"answer the httpProxyServer. Take into account that as a Preference the Server might appear as an empty string but HTTPSocket expect it to be nil"
	<preference: 'HTTP Proxy Server'
		category: 'HTTP Proxy'
		description: 'HTTP Proxy Server. Leave blank if you don''t want to use a Proxy'
		type: #String>
	^HTTPProxyServer ifNil:['']
