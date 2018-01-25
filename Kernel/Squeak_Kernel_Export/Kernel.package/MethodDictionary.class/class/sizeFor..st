sizing
sizeFor: numberOfElements
	"Return the minimum capacity of a dictionary that can hold numberOfElements elements. At least 25% of the array must be empty and the return value must be a power of 2."

	^(numberOfElements * 4 // 3 max: 1) asLargerPowerOfTwo