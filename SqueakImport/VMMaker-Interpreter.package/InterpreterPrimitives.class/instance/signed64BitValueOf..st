primitive support
signed64BitValueOf: oop
	"Convert the given object into an integer value.
	The object may be either a positive ST integer or a eight-byte LargeInteger."
	| sz value largeClass negative szsqLong |
	<inline: false>
	<returnTypeC: 'sqLong'>
	<var: 'value' type: 'sqLong'>
	(objectMemory isIntegerObject: oop) ifTrue: [^self cCoerce: (objectMemory integerValueOf: oop) to: 'sqLong'].
	sz := objectMemory lengthOf: oop.
	sz > 8 ifTrue: [^ self primitiveFail].
	largeClass := objectMemory fetchClassOf: oop.
	largeClass = objectMemory classLargePositiveInteger
		ifTrue:[negative := false]
		ifFalse:[largeClass = objectMemory classLargeNegativeInteger
					ifTrue:[negative := true]
					ifFalse:[^self primitiveFail]].
	szsqLong := self
		cCode: 'sizeof(sqLong)'
		inSmalltalk: [8].
	sz > szsqLong 
		ifTrue: [^ self primitiveFail].
	value := 0.
	0 to: sz - 1 do: [:i |
		value := value + ((self cCoerce: (objectMemory fetchByte: i ofObject: oop) to: 'sqLong') <<  (i*8))].
	"Fail if value exceeds range of a 64-bit twos-complement signed integer."
	negative
		ifTrue:["perform subtraction using unsigned usqLong to prevent undefined result
				for optimizing C compilers in the case of value = 16r8000000000000000"
				value := 0 - (self cCoerce: value to: 'usqLong').
				value >= 0 ifTrue: [^ self primitiveFail]]
		ifFalse:[value < 0 ifTrue:[^ self primitiveFail]].
	^ value