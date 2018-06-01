as yet unclassified
labelGraphic: aForm
	| oldLabel graphicalMorph |
	(oldLabel := self findA: SketchMorph)
		ifNotNil: [oldLabel delete].
	graphicalMorph := SketchMorph withForm: aForm.
	self extent: graphicalMorph extent + (borderWidth + 6).
	graphicalMorph position: self center - (graphicalMorph extent // 2).
	self addMorph: graphicalMorph.
	graphicalMorph 
		baseGraphic;
		lock.
