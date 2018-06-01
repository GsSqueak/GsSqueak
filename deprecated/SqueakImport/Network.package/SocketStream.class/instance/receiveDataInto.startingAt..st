private-socket
receiveDataInto: buffer startingAt: index.
	"Read data from the underlying socket. This method may be overridden by subclasses wanting to control incoming traffic for other purposes like encryption or statistics."

	^socket  receiveAvailableDataInto: buffer startingAt: index.