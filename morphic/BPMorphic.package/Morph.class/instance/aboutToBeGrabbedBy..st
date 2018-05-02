dropping/grabbing
aboutToBeGrabbedBy: aHand
  "The receiver is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand."

  | cmd |
  self formerOwner: self owner.
  self formerPosition: self position.
  cmd := self undoGrabCommand.
  cmd ifNotNil: [ self setProperty: #'undoGrabCommand' toValue: cmd ].
  (self valueOfProperty: #'expandedExtent')
    ifNotNil: [ :extentToHandToHand | 
      self removeProperty: #'expandedExtent'.
      self extent: extentToHandToHand ]