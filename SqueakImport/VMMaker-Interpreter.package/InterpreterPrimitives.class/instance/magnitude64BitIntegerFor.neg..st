primitive support
magnitude64BitIntegerFor: magnitude neg: isNegative
	"Return a Large Integer object for the given integer magnitude and sign"
	| newLargeInteger largeClass intValue highWord sz isSmall smallVal |
	<var: 'magnitude' type: 'usqLong'>
	<var: 'highWord' type: 'usqInt'>

	isSmall := isNegative
		ifTrue: [magnitude <= 16r40000000]
		ifFalse: [magnitude < 16r40000000].
	isSmall
		ifTrue:
			[smallVal := self cCoerce: magnitude to: #sqInt.
			isNegative	ifTrue: [smallVal := 0 - smallVal].
			^self integerObjectOf: smallVal].
	isNegative
		ifTrue:[	largeClass := self classLargeNegativeInteger]
		ifFalse:[	largeClass := self classLargePositiveInteger].
	highWord := self cCode: 'magnitude >> 32'. "shift is coerced to usqInt otherwise"
	highWord = 0 
		ifTrue: [sz := 4] 
		ifFalse:[
			sz := 5.
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
			(highWord := highWord >> 8) = 0 ifFalse:[sz := sz + 1].
		].
	newLargeInteger := self instantiateClass: largeClass indexableSize:  sz.
	0 to: sz-1 do: [:i |
		intValue := self cCode: '(magnitude >> (i * 8)) & 255'.
		self storeByte: i ofObject: newLargeInteger withValue: intValue].
	^ newLargeInteger