utilities
ensureNetworkConnected
	"Try to ensure that an intermittent network connection, such as a dialup or ISDN line, is actually connected. This is necessary to make sure a server is visible in order to accept an incoming connection. If the network connection does not work - the user has given up - return false. Otherwise, return true."
	"RemoteHandMorph ensureNetworkConnected"
	| address |
	UIManager default
		informUser: 'Ensuring your network connection works...'
		during: [
			address := (NetNameResolver
				addressForName: 'squeak.org'
				timeout: 30)].
	^ address notNil.