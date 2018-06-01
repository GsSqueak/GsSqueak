instance creation
newUDP: family
	"Create a socket and initialise it for UDP"
	self initializeNetwork.
	^[ super new initialize: UDPSocketType family: family ]
		repeatWithGCIf: [ :socket | socket isValid not ]