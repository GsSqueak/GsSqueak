initialization
initialize
"initialize the state of the receiver"
	super initialize.
""
	lastDisplayTime := 0.
	framesSinceLastDisplay := 0.
	self font: (Preferences standardMenuFont emphasized: 1).
