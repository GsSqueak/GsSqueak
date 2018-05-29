datagrams
setPort: portNumber interface: ifAddr
	"Allow an UDP socket to bind to a specific interface."
 
	self primSocket: socketHandle listenOn: portNumber backlogSize: 0 interface: ifAddr asByteArray.
