world state
paintBox
	"Return the painting controls widget (PaintBoxMorph) to be used for painting in this world. If there is not already a PaintBox morph, or if it has been deleted from this world, create a new one."

	| newPaintBox refPoint aPalette |
	self allMorphsDo: [:m | (m isKindOf: PaintBoxMorph) ifTrue: [^ m]].
	refPoint := (aPalette := self standardPalette)
		ifNotNil:
			[aPalette showNoPalette.
			aPalette topRight + (0 @ 12)]
		ifNil:
			[self topRight].
	newPaintBox := PaintBoxMorph new.
	newPaintBox position: (refPoint - (newPaintBox width @ 0)). 
	self addMorph: newPaintBox.
	^ newPaintBox
