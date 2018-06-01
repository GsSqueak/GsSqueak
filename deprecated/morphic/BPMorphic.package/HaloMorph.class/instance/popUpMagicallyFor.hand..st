pop up
popUpMagicallyFor: aMorph hand: aHand 
	"Programatically pop up a halo for a given hand."
	super popUpMagicallyFor: aMorph hand: aHand.
	Preferences magicHalos
		ifTrue: [self isMagicHalo: true].
	(Preferences haloTransitions not
			and: [self isMagicHalo])
		ifTrue: [self magicAlpha: 0.2]