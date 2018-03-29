debug printing
lengthOfNameOfClass: classOop 
	| _gsSqueakTemp_numSlots |
	_gsSqueakTemp_numSlots := objectMemory numSlotsOf: classOop.
	_gsSqueakTemp_numSlots = metaclassNumSlots
		ifTrue: [^ self
				lengthOfNameOfClass: (objectMemory fetchPointer: thisClassIndex ofObject: classOop)].
	_gsSqueakTemp_numSlots <= classNameIndex
		ifTrue: [^ 0].
	^ objectMemory
		lengthOf: (objectMemory fetchPointer: classNameIndex ofObject: classOop)