accessing
currentSound
	^ currentSound ifNil: [currentSound := self nextSound]