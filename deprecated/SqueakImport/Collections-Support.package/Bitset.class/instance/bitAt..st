bit manipulation
bitAt: anInteger
	"Return the bit corresponding to anInteger."

	^((bytes at: (anInteger bitShift: -3) + 1) bitShift: 0 - (anInteger bitAnd: 7)) bitAnd: 1
		