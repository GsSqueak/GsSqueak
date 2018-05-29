I represent a local or remote network service.

Instance Variables
	addressFamily:	<SmallInteger> the address family (unix, inet4, inet6, ...) in which the service address is available.
	protocol:		<SmallInteger> the protocol (tcp, udp, ...) that the service uses.
	socketAddress:	<SocketAddress> the socket address at which the service can be contacted or created.
	socketType:		<SmallInteger> the type (stream, dgram) of the socket that should be created for communication with the service.
