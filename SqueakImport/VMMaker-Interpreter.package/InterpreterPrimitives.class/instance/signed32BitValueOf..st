primitive support
signed32BitValueOf: oop
	"Convert the given object into an integer value.
	The object may be either a positive ST integer or a four-byte LargeInteger."
	| value largeClass negative |
	<inline: false>
	<returnTypeC: 'int'>
	<var: 'value' type: 'int'>
	(objectMemory isIntegerObject: oop) ifTrue: [^objectMemory integerValueOf: oop].
	(objectMemory lengthOf: oop) > 4 ifTrue: [^ self primitiveFail].
	largeClass := objectMemory fetchClassOf: oop.
	largeClass = objectMemory classLargePositiveInteger
		ifTrue:[negative := false]
		ifFalse:[largeClass = objectMemory classLargeNegativeInteger
					ifTrue:[negative := true]
					ifFalse:[^self primitiveFail]].
	(objectMemory lengthOf: oop) ~= 4 ifTrue: [^ self primitiveFail].
	value := (objectMemory fetchByte: 0 ofObject: oop) +
		  ((objectMemory fetchByte: 1 ofObject: oop) <<  8) +
		  ((objectMemory fetchByte: 2 ofObject: oop) << 16) +
		  ((objectMemory fetchByte: 3 ofObject: oop) << 24).
	"Fail if value exceeds range of a 32-bit twos-complement signed integer."
	negative
		ifTrue:["perform subtraction using unsigned int to prevent undefined result
				for optimizing C compilers in the case of value = 16r80000000"
				value := 0 - (self cCoerce: value to: 'unsigned int').
				value >= 0 ifTrue: [^ self primitiveFail]]
		ifFalse:[value < 0 ifTrue:[^ self primitiveFail]].
	^ value