initialize
initializeUpButton
"initialize the receiver's upButton"
	upButton := RectangleMorph newBounds: self boundsForUpButton.
	upButton
		on: #mouseDown
		send: #scrollUpInit
		to: self.
	upButton
		on: #mouseUp
		send: #finishedScrolling
		to: self.
	self updateUpButtonImage.
	self addMorph: upButton.	
	upButton visible: self class scrollBarsWithoutArrowButtons not.