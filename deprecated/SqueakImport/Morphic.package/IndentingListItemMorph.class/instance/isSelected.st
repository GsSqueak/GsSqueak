testing
isSelected

	^ container ifNil: [false] ifNotNil: [container selectedMorph == self]