initialization
initialize
	"initialize the state of the receiver"
	super initialize.

	trackPointer := true.
	showPointer := false.
	magnification := 2.

	self extent: 128 @ 128