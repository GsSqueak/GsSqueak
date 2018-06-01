initialization
initialize
	
	super initialize.
	
	self acceptOnCR: false.
	self dragEnabled: self class draggableTextSelection.
	self dropEnabled: self class draggableTextSelection.