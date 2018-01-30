halos and balloon help
balloonMorphClass
	^ NewBalloonMorph useNewBalloonMorph
		ifTrue: [NewBalloonMorph]
		ifFalse: [BalloonMorph]