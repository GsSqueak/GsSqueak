initialization
initialize
"initialize the state of the receiver"
	super initialize.
""
	flashing := false.
	flash := false.
	self scrollInit.
	self digits: 2.
	self value: 0