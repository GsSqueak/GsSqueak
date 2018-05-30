testing
isDataAvailable
	"Answer if more data can be read. It the inbuffer is empty, we read more data.

	Note: It is important not to rely on 'socket dataAvailable' here since this will
	not work for subclasses such as SecureSocketStream (which can contain
	undecrypted contents that has been read from the socket)."
 
	self isInBufferEmpty ifFalse: [^true].
	^self receiveAvailableData < inNextToWrite
