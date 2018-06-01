initialize
initializeMenuButton
	"initialize the receiver's menuButton"
	"Preferences disable: #scrollBarsWithoutMenuButton"
	"Preferences enable: #scrollBarsWithoutMenuButton"
	menuButton := RectangleMorph newBounds: self boundsForMenuButton.
	menuButton
		on: #mouseEnter
		send: #menuButtonMouseEnter:
		to: self.
	menuButton
		on: #mouseDown
		send: #menuButtonMouseDown:
		to: self.
	menuButton
		on: #mouseLeave
		send: #menuButtonMouseLeave:
		to: self.
	"menuButton 
	addMorphCentered: (RectangleMorph 
	newBounds: (0 @ 0 extent: 4 @ 2) 
	color: Color black)."
	self updateMenuButtonImage.
	self addMorphFront: menuButton.
	menuButton visible: (self class scrollBarsWithoutMenuButton
			or: [self orientation == #horizontal]) not