initialization
initialize
	super initialize.
	self listDirection: #topToBottom.
	self layoutInset: 0.
	self hResizing: #rigid. "... this is very unlikely..."
	self vResizing: #rigid