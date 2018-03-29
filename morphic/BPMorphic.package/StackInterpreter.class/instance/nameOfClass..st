debug printing
nameOfClass: classOop 
	"Brain-damaged nameOfClass: for C VM. Does *not* answer Foo class
	for metaclasses.
	Use e.g. classIsMeta: to avoid being fooled."
	| _gsSqueakTemp_numSlots _gsSqueakTemp_maybeNameOop _gsSqueakTemp_maybeThisClassOop |
	_gsSqueakTemp_numSlots := objectMemory numSlotsOf: classOop.
	_gsSqueakTemp_numSlots = metaclassNumSlots
		ifTrue: [_gsSqueakTemp_maybeThisClassOop := objectMemory fetchPointer: thisClassIndex ofObject: classOop.
			(self addressCouldBeClassObj: _gsSqueakTemp_maybeThisClassOop)
				ifTrue: [^ self
						nameOfClass: (objectMemory fetchPointer: thisClassIndex ofObject: classOop)].
			^ 'bad class'].
	(_gsSqueakTemp_numSlots > classNameIndex
			and: [_gsSqueakTemp_maybeNameOop := objectMemory fetchPointer: classNameIndex ofObject: classOop.
				objectMemory isBytes: _gsSqueakTemp_maybeNameOop])
		ifFalse: [^ 'bad class'].
	^ objectMemory firstIndexableField: _gsSqueakTemp_maybeNameOop