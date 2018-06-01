sound generation
reset
	super reset.
	self currentSound
		ifNil: [self currentSound: self nextSound]
		ifNotNil: [:curSound | curSound reset]