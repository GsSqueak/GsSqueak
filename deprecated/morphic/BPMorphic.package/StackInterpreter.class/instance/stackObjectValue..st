stack access
stackObjectValue: offset 
	"Ensures that the given object is a real object, not a SmallInteger."
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_oop |
	_gsSqueakTemp_oop := stackPages longAt: stackPointer + (offset * objectMemory wordSize).
	(objectMemory isImmediate: _gsSqueakTemp_oop)
		ifTrue: [self primitiveFail.
			^ nil].
	^ _gsSqueakTemp_oop