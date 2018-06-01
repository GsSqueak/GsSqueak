proxy settings
httpProxyPort
	"answer the httpProxyPort"
	<preference: 'HTTP Proxy Port'
		category: 'HTTP Proxy'
		description: 'HTTP Proxy Port'
		type: #Number>
	^HTTPProxyPort ifNil:[80]