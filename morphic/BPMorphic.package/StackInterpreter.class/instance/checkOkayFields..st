debug support
checkOkayFields: oop 
	"Check if the argument is an ok object.
	If this is a pointers object, check that its fields are all okay oops."
	| _gsSqueakTemp_hasYoung _gsSqueakTemp_i _gsSqueakTemp_fieldOop |
	(oop = nil
			or: [oop = 0])
		ifTrue: [^ true].
	"?? eem 1/16/2013"
	(objectMemory isIntegerObject: oop)
		ifTrue: [^ true].
	(objectMemory checkOkayOop: oop)
		ifFalse: [^ false].
	(objectMemory checkOopHasOkayClass: oop)
		ifFalse: [^ false].
	((objectMemory isPointersNonImm: oop)
			or: [objectMemory isCompiledMethod: oop])
		ifFalse: [^ true].
	_gsSqueakTemp_hasYoung := objectMemory hasSpurMemoryManagerAPI not
				and: [objectMemory
						isYoung: (objectMemory fetchClassOfNonImm: oop)].
	(objectMemory isCompiledMethod: oop)
		ifTrue: [_gsSqueakTemp_i := (objectMemory literalCountOf: oop)
						+ LiteralStart - 1]
		ifFalse: [(objectMemory isContext: oop)
				ifTrue: [_gsSqueakTemp_i := CtxtTempFrameStart
								+ (self fetchStackPointerOf: oop) - 1]
				ifFalse: [_gsSqueakTemp_i := (objectMemory lengthOf: oop)
								- 1]].
	[_gsSqueakTemp_i >= 0]
		whileTrue: [_gsSqueakTemp_fieldOop := objectMemory fetchPointer: _gsSqueakTemp_i ofObject: oop.
			(objectMemory isIntegerObject: _gsSqueakTemp_fieldOop)
				ifFalse: [_gsSqueakTemp_hasYoung := _gsSqueakTemp_hasYoung
								or: [objectMemory isYoung: _gsSqueakTemp_fieldOop].
					(objectMemory checkOkayOop: _gsSqueakTemp_fieldOop)
						ifFalse: [^ false].
					(self checkOopHasOkayClass: _gsSqueakTemp_fieldOop)
						ifFalse: [^ false]].
			_gsSqueakTemp_i := _gsSqueakTemp_i - 1].
	_gsSqueakTemp_hasYoung
		ifTrue: [^ objectMemory checkOkayYoungReferrer: oop].
	^ true