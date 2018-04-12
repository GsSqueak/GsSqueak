other
addPlayerMenuItemsTo: aMenu hand: aHandMorph 
	self getPenDown
		ifTrue: [aMenu add: 'pen up' action: #liftPen]
		ifFalse: [aMenu add: 'pen down' action: #lowerPen].
	aMenu add: 'pen size' action: #choosePenSize.
	aMenu add: 'pen color' action: #choosePenColor: