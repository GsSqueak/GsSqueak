instance creation
newTCP: family
	"Create a socket and initialise it for TCP"
	self initializeNetwork.
	^[ super new initialize: TCPSocketType family: family ]
		repeatWithGCIf: [ :socket | socket isValid not ]