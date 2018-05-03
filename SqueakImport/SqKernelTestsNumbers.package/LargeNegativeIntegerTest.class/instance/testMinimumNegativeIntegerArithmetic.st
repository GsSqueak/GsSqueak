tests
testMinimumNegativeIntegerArithmetic
	"We are speaking of minimum integer in underlying hardware here.
	In 2-complement, abs(INT_MIN) = (INT-MAX+1) and thus overflows hardware register.
	Since some old VM forgot this edge case they may fail and it's better to be aware of it.
	http://code.google.com/p/cog/issues/detail?id=92
	http://bugs.squeak.org/view.php?id=7705
	We only test the cases of 32 and 64 bit signed integers."

	#(32 64) do: [:nBits |
		| largePositiveInt largeNegativeInt |
		largePositiveInt := (1 << (nBits - 1)).
		largeNegativeInt := largePositiveInt negated.
		self assert: (largeNegativeInt >> 3) equals: (largeNegativeInt bitInvert >> 3) bitInvert.
		self assert: (largeNegativeInt + 1) equals: (largePositiveInt - 1) negated.
		self assert: (largeNegativeInt - -1) equals: (largePositiveInt - 1) negated.
		self assert: (largeNegativeInt // -1) equals: largePositiveInt.
		self assert: (largeNegativeInt \\ -1) equals: 0.
		self assert: (largeNegativeInt rem: -1) equals: 0.
		self assert: (largeNegativeInt quo: -1) equals: largePositiveInt.
		self assert: (largeNegativeInt * -1) equals: largePositiveInt.
		self assert: (largeNegativeInt / -1) equals: largePositiveInt]