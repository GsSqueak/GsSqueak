accessing
color: c
	
	self onImage ifNotNil: [:form |
		self onImage: ((form asFormOfDepth: 32) collectColors: [:col | c alpha: col alpha])].
	self offImage ifNotNil: [:form |
		self offImage: ((form asFormOfDepth: 32) collectColors: [:col | c alpha: col alpha])].
	self pressedImage ifNotNil: [:form |
		self pressedImage: ((form asFormOfDepth: 32) collectColors: [:col | c alpha: col alpha])].
	
	^ super color: c