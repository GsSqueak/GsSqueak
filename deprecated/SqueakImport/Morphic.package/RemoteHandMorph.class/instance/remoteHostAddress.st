connections
remoteHostAddress
	"Return the address of the remote host or zero if not connected."
	^remoteAddress ifNil:[0]