event handling
click: evt
	self showBalloon: 'click' hand: evt hand.
	self borderColor: (self borderColor = self defaultBorderColor ifTrue: [self alternateBorderColor] ifFalse: [self defaultBorderColor])
