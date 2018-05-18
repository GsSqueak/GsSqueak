accessing
balloonOwner: aMorph

	balloonOwner == aMorph ifTrue: [^ self].
	balloonOwner := aMorph.
	self updateColorsForBalloonOwner.