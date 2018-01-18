structure
activeHand	^ ActiveHand		ifNil: [self isInWorld				ifTrue: [self world activeHand]]