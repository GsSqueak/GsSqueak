halos and balloon help
showBalloon: msgString hand: aHand 
	"Pop up a balloon containing the given string. Note that any existing
	BalloonMorphs will be removed from the world."
	| balloon |
	self isInWorld
		ifFalse: [^ self].
	balloon := self balloonMorphClass string: msgString for: self balloonHelpAligner.
	balloon
		popUpFor: self
		hand: (aHand
				ifNil: [self world activeHand])