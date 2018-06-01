world state
paintBoxOrNil
	"Return the painting controls widget (PaintBoxMorph) to be used for
	painting in this world. If there is not already a PaintBox morph return
	nil "
	self
		allMorphsDo: [:m | (m isKindOf: PaintBoxMorph)
				ifTrue: [^ m]].
	^ nil