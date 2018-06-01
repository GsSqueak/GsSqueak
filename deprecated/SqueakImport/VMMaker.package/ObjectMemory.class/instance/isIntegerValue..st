interpreter access
isIntegerValue: intValue
	"Return true if the given value can be represented as a Smalltalk integer value."
	"Use a shift and XOR to set the sign bit if and only if the top two bits of the given
	value are the same, then test the sign bit. Note that the top two bits are equal for
	exactly those integers in the range that can be represented in 31-bits or 63-bits.

	Operands are coerced to machine integer size so the test will work with 64 bit
	images on 32 bit hosts. When running on a 32 bit host, the cast to int has little
	or no performance impact for either 32 bit or 64 bit images.

	On a 64 bit host, the shift and XOR test is replaced by an explicit range check,
	which provides the best performance for both 32 bit and 64 bit images.

	If the range of small integers is enlarged for 64 bit images, this method must
	be updated accordingly."

	^ self isDefined: 'SQ_HOST32'
		inSmalltalk: [true]
		comment: 'cast to int for 64 bit image on 32 bit host'
		ifTrue: ((self cCoerce: intValue to: 'int')
					bitXor: ((self cCoerce: intValue to: 'int') << 1)) >= 0
		ifFalse: (intValue >= 16r-40000000 and: [intValue <= 16r3FFFFFFF])