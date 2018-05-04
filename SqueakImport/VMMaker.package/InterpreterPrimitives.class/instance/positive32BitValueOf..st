primitive support
positive32BitValueOf: oop
	"Convert the given object into an integer value.
	The object may be either a positive ST integer or a four-byte LargePositiveInteger."

	| sz value |
	(objectMemory isIntegerObject: oop) ifTrue: [
		value := objectMemory integerValueOf: oop.
		value < 0 ifTrue: [^ self primitiveFail].
		^ value].

	self assertClassOf: oop is: (objectMemory splObj: ClassLargePositiveInteger).
	self successful ifTrue: [
		sz := objectMemory lengthOf: oop.
		sz = 4 ifFalse: [^ self primitiveFail]].
	self successful ifTrue: [
		^ (objectMemory fetchByte: 0 ofObject: oop) +
		  ((objectMemory fetchByte: 1 ofObject: oop) <<  8) +
		  ((objectMemory fetchByte: 2 ofObject: oop) << 16) +
		  ((objectMemory fetchByte: 3 ofObject: oop) << 24) ].