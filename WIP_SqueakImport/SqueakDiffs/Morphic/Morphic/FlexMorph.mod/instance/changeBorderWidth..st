menus
changeBorderWidth: evt
	| handle origin aHand |
	aHand := evt ifNil: [self primaryHand] ifNotNil: [evt hand].
	origin := aHand position.
	handle := HandleMorph new forEachPointDo:
		[:newPoint | handle removeAllMorphs.
		handle addMorph:
			(LineMorph from: origin to: newPoint color: Color black width: 1).
		self borderWidth: (newPoint - origin) r asInteger // 5].
	aHand attachMorph: handle.
	handle startStepping