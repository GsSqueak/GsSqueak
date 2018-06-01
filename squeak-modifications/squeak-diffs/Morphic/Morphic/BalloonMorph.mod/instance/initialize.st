initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self beSmoothCurve.

	offsetFromTarget := 0 @ 0.
	
	self setDefaultParameters.