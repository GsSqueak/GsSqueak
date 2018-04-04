IEEE 754
testZero2
	self assert: (Float negativeZero asIEEE32BitWord printPaddedWith: $0 to: 32 base: 2) =
		'10000000000000000000000000000000'.
	self assert: (Float fromIEEE32Bit:
		(Integer readFrom: '10000000000000000000000000000000' readStream base: 2))
			= Float negativeZero