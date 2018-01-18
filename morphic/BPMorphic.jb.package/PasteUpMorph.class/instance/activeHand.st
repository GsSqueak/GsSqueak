structure
activeHand	^ worldState		ifNil: [super activeHand]		ifNotNil: [:ws | ws activeHand				ifNil: [ws hands first]]