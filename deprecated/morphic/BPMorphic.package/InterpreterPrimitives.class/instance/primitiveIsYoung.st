memory space primitives
primitiveIsYoung
	"Primitive. Answer whether the argument to the primitive resides in
	young space."
	| _gsSqueakTemp_oop |
	"for now..."
	_gsSqueakTemp_oop := self stackObjectValue: 0.
	self successful
		ifTrue: [self
				pop: argumentCount + 1
				thenPushBool: (self oop: _gsSqueakTemp_oop isGreaterThanOrEqualTo: objectMemory youngStart)]