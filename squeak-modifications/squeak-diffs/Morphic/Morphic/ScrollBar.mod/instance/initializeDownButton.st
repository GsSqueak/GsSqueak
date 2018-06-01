initialize
initializeDownButton
	"initialize the receiver's downButton"

	downButton := RectangleMorph newBounds: self boundsForDownButton.
	downButton 
		on: #mouseDown
		send: #scrollDownInit
		to: self.
	downButton 
		on: #mouseUp
		send: #finishedScrolling
		to: self.
	self updateDownButtonImage.	
	self addMorphFront: downButton.
	downButton visible: self class scrollBarsWithoutArrowButtons not.