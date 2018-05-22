position
moveSelectedButtonToHand: aHand
	"Just let the user confirm the selected button without having to reposition the mouse."
	
	self ensureSelectedButton.
	self moveTo: self fullBounds center + (aHand position - self selectedButton center).