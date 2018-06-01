instance creation
newTCP
	"Create a socket and initialise it for TCP"
	^self newTCP: SocketAddressInformation addressFamilyINET4