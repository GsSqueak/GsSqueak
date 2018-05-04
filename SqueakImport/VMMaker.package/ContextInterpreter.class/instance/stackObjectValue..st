contexts
stackObjectValue: offset
	"Ensures that the given object is a real object, not a SmallInteger."

	| oop |
	oop := objectMemory longAt: stackPointer - (offset * objectMemory bytesPerWord).
	(objectMemory isIntegerObject: oop) ifTrue: [self primitiveFail. ^ nil].
	^ oop
