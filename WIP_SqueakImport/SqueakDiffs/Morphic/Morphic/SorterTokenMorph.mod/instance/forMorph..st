as yet unclassified
forMorph: aMorph 
	| it |
	morphRepresented := aMorph.
	aMorph submorphs notEmpty 
		ifTrue: 
			[self addMorphBack: (it := aMorph submorphs first veryDeepCopy).
			it position: self position + (1 @ 1).
			it lock].
	self fitContents