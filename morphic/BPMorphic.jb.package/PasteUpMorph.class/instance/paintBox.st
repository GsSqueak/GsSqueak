world state
paintBox
	"Return the painting controls widget (PaintBoxMorph) to be used for
	painting in this world. If there is not already a PaintBox morph, or if it
	has been deleted from this world, create a new one."
	| newPaintBox refPoint |
	self
		allMorphsDo: [:m | (m isKindOf: PaintBoxMorph)
				ifTrue: [^ m]].
	refPoint := self standardPalette
				ifNil: [self topRight]
				ifNotNil: [:aPalette | 
					aPalette showNoPalette.
					aPalette topRight + (0 @ 12)].
	newPaintBox := PaintBoxMorph new.
	newPaintBox position: refPoint - (newPaintBox width @ 0).
	self addMorph: newPaintBox.
	^ newPaintBox