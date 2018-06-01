connections
stopListening
	"Destroy the socket, if any, terminating the connection."

	socket ifNotNil: [
		socket destroy.
		socket := nil].
