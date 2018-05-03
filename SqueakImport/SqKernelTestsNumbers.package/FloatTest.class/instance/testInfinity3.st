IEEE 754
testInfinity3
	self assert: (Float negativeInfinity asIEEE32BitWord printPaddedWith: $0 to: 32 base: 2) =
		'11111111100000000000000000000000'.
	self assert: (Float fromIEEE32Bit:
		(Integer readFrom: '11111111100000000000000000000000' readStream base: 2))
			= Float negativeInfinity