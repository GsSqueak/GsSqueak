misc
move
	(owner isWorldMorph
			and: [self isSticky not])
		ifTrue: [self activeHand grabMorph: self]