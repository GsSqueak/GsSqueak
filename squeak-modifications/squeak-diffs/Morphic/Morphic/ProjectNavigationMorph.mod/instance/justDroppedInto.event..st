dropping/grabbing
justDroppedInto: aMorph event: anEvent

	self setProperty: #stickToTop toValue: nil.
	self positionVertically.
	LastManualPlacement := {self position. self valueOfProperty: #stickToTop}.
	super justDroppedInto: aMorph event: anEvent.
	self step