balloon help
spawnBalloonFor: aMorph

	aMorph wantsBalloon ifFalse: [^ self].
	aMorph showBalloon: aMorph balloonText hand: self.