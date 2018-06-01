datagrams
setPeer: hostAddress port: port
	"Set the default send/recv address."

	self primSocket: socketHandle connectTo: hostAddress asByteArray port: port.
