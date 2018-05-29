private-socket
sendData: buffer count: n
	"Sends outgoing data directly on the underlying socket."

	^socket sendData: buffer count: n