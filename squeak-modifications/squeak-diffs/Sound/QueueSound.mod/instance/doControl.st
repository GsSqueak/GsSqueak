sound generation
doControl
	super doControl.
	self currentSound ifNotNil: [:curSound | curSound doControl]