utilities
assertClassOf: oop is: classOop
	"Succeed if the given (non-integer) object is an instance of the given class. Fail if the object is an integer."

	| ccIndex cl |
	<inline: true>
	(objectMemory isIntegerObject: oop)
		ifTrue: [ self primitiveFail. ^ nil ].

	ccIndex := ((objectMemory baseHeader: oop) >> 12) bitAnd: 16r1F.
	ccIndex = 0
		ifTrue: [ cl := ((objectMemory classHeader: oop) bitAnd: objectMemory allButTypeMask) ]
		ifFalse: [
			"look up compact class"
			cl := (objectMemory fetchPointer: (ccIndex - 1)
					ofObject: (objectMemory fetchPointer: CompactClasses ofObject: objectMemory getSpecialObjectsOop))].

	self success: cl = classOop.
