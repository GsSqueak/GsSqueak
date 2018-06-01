accessing
hoverRow: anInteger

	hoverRow = anInteger ifTrue: [^ self].
	
	hoverRow ifNotNil: [self listMorph rowChanged: hoverRow].
	hoverRow := anInteger.
	hoverRow ifNotNil: [self listMorph rowChanged: hoverRow].
	
	self wantsBalloon ifTrue: [
		self activeHand
			removePendingBalloonFor: self;
			triggerBalloonFor: self after: self balloonHelpDelayTime].