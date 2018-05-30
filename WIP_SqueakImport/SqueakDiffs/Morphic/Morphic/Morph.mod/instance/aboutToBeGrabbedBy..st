dropping/grabbing
aboutToBeGrabbedBy: aHand
	"The receiver is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand."
	| extentToHandToHand cmd |
	self formerOwner: owner.
	self formerPosition: self position.
	cmd := self undoGrabCommand.
	cmd ifNotNil:[self setProperty: #undoGrabCommand toValue: cmd].
	(extentToHandToHand := self valueOfProperty: #expandedExtent)
			ifNotNil:
				[self removeProperty: #expandedExtent.
				self extent: extentToHandToHand].
	^self "Grab me"