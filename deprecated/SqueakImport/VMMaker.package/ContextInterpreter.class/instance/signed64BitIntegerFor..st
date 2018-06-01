primitive support
signed64BitIntegerFor: integerValue
	"Return a Large Integer object for the given integer value"
	| newLargeInteger magnitude largeClass intValue highWord sz |
	<inline: false>
	<var: 'integerValue' type: 'sqLong'>
	<var: 'magnitude' type: 'unsigned sqLong'>
	<var: 'highWord' type: 'usqInt'>

	integerValue < 0
		ifTrue:[	largeClass := objectMemory classLargeNegativeInteger.
				magnitude := 0 - integerValue]
		ifFalse:[	largeClass := objectMemory classLargePositiveInteger.
				magnitude := integerValue].

	magnitude <= 16r7FFFFFFF ifTrue:[^self signed32BitIntegerFor: integerValue].

	highWord := self
		cCode: 'magnitude >> 32'  "shift is coerced to usqInt otherwise"
		inSmalltalk: [magnitude bitShift: -32].
	highWord = 0 
		ifTrue:[sz := 4] 
		ifFalse:[
			sz := 5.
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
		].
	newLargeInteger := objectMemory instantiateClass: largeClass indexableSize:  sz.
	0 to: sz-1 do: [:i |
		intValue := self
			cCode: '(magnitude >> (i * 8)) & 255'
			inSmalltalk: [(magnitude bitShift: (i * 8) negated) bitAnd: 16rFF].
		objectMemory storeByte: i ofObject: newLargeInteger withValue: intValue].
	^ newLargeInteger