as yet unclassified
labelGraphic: aForm 
	| _gsSqueakTemp_graphicalMorph |
	(self findA: SketchMorph)
		ifNotNil: [:_gsSqueakTemp_oldLabel | _gsSqueakTemp_oldLabel delete].
	_gsSqueakTemp_graphicalMorph := SketchMorph withForm: aForm.
	self extent: _gsSqueakTemp_graphicalMorph extent + (borderWidth + 6).
	_gsSqueakTemp_graphicalMorph position: self center - (_gsSqueakTemp_graphicalMorph extent // 2).
	self addMorph: _gsSqueakTemp_graphicalMorph.
	_gsSqueakTemp_graphicalMorph baseGraphic; lock