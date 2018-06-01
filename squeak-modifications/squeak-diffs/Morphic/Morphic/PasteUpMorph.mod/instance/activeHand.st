structure
activeHand

	^ worldState
		ifNotNil: [:ws | ws activeHand ifNil: [ws hands first]]
		ifNil: [super activeHand]