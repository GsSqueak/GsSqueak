menu
setAtomCount

	| countString count |
	countString := UIManager default
		request: 'Number of atoms?'
		initialAnswer: self submorphCount printString.
	countString isEmpty ifTrue: [^ self].
	count := Integer readFrom: (ReadStream on: countString).
	self removeAllMorphs.
	self addAtoms: count.
