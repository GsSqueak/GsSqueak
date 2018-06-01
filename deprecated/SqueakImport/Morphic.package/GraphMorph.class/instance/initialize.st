initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	self extent: 365 @ 80.

	dataColor := Color darkGray.
	cursor := 1.0.
	"may be fractional"
	cursorColor := Color red.
	cursorColorAtZeroCrossings := Color red.
	startIndex := 1.
	hasChanged := false.
	self
		data: ((0 to: 360 - 1)
				collect: [:x | (100.0 * x degreesToRadians sin) asInteger])