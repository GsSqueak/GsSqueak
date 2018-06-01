example
finger: userName at: aHostnameOrAddressString
	"SocketStream finger: 'stp' at: 'example.com'"

	| s |
	s := SocketStream openConnectionToHost: aHostnameOrAddressString port: 79.  "finger port number"
	Transcript show: '---------- Connecting ----------'; cr.
	s sendCommand: userName.
	Transcript show: s getLine.
	s close.
	Transcript show: '---------- Connection Closed ----------'; cr; endEntry.
