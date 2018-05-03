tests - bitLogic
testBitCount
	self assert: 2r0 bitCount equals: 0.
	self assert: 2r1 bitCount equals: 1.
	self assert: 2r101 bitCount equals: 2.
	self assert: 2r1010000000000000000100000000000000000000000010000000000001001 bitCount equals: 6.

	1 to: 100 do: [:i |
		self assert: (2r1 << i) bitCount equals: 1.
		self assert: (2r101 << i) bitCount equals: 2].

	self should: [-2 bitCount] raise: Error description: 'Negative integers have an infinite number of leading 1 in two complement representation'.