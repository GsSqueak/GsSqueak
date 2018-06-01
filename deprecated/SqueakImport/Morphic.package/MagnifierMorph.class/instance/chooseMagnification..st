menu
chooseMagnification: evt
	| handle origin aHand currentMag |
	currentMag := magnification.
	aHand := evt ifNil: [self currentHand] ifNotNil: [evt hand].
	origin := aHand position y.
	handle := HandleMorph new forEachPointDo:
		[:newPoint | self magnification: (newPoint y - origin) / 8.0 + currentMag].
	aHand attachMorph: handle.
	handle startStepping.
	self changed. "Magnify handle"