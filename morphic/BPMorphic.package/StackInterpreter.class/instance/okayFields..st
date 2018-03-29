debug support
okayFields: oop 
	"Check if the argument is an ok object.
	If this is a pointers object, check that its fields are all okay oops."
	| _gsSqueakTemp_i _gsSqueakTemp_fieldOop |
	(oop = nil
			or: [oop = 0])
		ifTrue: [^ true].
	(objectMemory isIntegerObject: oop)
		ifTrue: [^ true].
	(objectMemory okayOop: oop)
		ifFalse: [^ false].
	(objectMemory oopHasOkayClass: oop)
		ifFalse: [^ false].
	((objectMemory isPointersNonImm: oop)
			or: [objectMemory isCompiledMethod: oop])
		ifFalse: [^ true].
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
				ifFalse: [(objectMemory okayOop: _gsSqueakTemp_fieldOop)
						ifFalse: [^ false].
					(self oopHasOkayClass: _gsSqueakTemp_fieldOop)
						ifFalse: [^ false]].
			_gsSqueakTemp_i := _gsSqueakTemp_i - 1].
	^ true