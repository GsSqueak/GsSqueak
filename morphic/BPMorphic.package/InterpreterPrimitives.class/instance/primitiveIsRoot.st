memory space primitives
primitiveIsRoot
	"Primitive. Answer whether the argument to the primitive is a root for
	young space"
	| _gsSqueakTemp_oop |
	_gsSqueakTemp_oop := self stackObjectValue: 0.
	self successful
		ifTrue: [self
				pop: argumentCount + 1
				thenPushBool: (objectMemory isYoungRoot: _gsSqueakTemp_oop)]