receiving
receiveDataInto: aStringOrByteArray startingAt: aNumber
	"Receive data into the given buffer and return the number of bytes received. 
	Note the given buffer may be only partially filled by the received data.
	Waits for data once.  The answer may be zero (indicating that no data was 
	available before the socket closed)."

	| bytesRead open |
	bytesRead := 0.
	open := true.
	[open and: [bytesRead = 0]] whileTrue:
		[self waitForDataIfClosed: [open := false].
		 open ifTrue:
			[bytesRead := self primSocket: socketHandle
								receiveDataInto: aStringOrByteArray
								startingAt: aNumber
								count: aStringOrByteArray size - aNumber + 1]].
	^bytesRead
