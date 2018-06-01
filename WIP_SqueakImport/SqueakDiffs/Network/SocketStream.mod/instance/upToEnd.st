stream in
upToEnd
	"Answer all data coming in on the socket until the socket
	is closed by the other end, or we get a timeout.
	This means this method catches ConnectionClosed by itself."

	[[self atEnd] whileFalse: [self beSignalingWhile:[self receiveData]]]
		on: ConnectionClosed
		do: [:ex | "swallow it"]. 
	^self nextAllInBuffer