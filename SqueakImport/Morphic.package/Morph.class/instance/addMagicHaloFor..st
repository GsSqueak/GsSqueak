halos and balloon help
addMagicHaloFor: aHand

	aHand halo ifNotNil: [:halo |
		halo target == self ifTrue:[^self].
		halo isMagicHalo ifFalse:[^self]].
	
	self createHalo
		popUpMagicallyFor: self hand: aHand