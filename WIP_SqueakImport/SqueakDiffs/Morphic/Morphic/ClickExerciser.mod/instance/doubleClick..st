event handling
doubleClick: evt
	self showBalloon: 'doubleClick' hand: evt hand.
	self color: ((color = self alternateColor ) ifTrue: [self defaultColor] ifFalse: [self alternateColor])
