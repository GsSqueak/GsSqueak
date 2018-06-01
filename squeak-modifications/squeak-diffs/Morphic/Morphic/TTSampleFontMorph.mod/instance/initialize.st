initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	smoothing := 4.
	self extent: 300 @ 300