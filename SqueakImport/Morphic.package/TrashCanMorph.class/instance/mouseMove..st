event handling
mouseMove: evt
	| hand firstSub |
	hand := evt hand.
	(((hand submorphCount > 0) and: [(firstSub := hand submorphs first) ~~ self]) and:
			[self wantsDroppedMorph: firstSub event: evt])
		ifTrue: 
			[super mouseMove: evt]
