zero behavior
testCopySign
	self assert: (0.0 copySignTo: 1) = 1.
	self assert: (Float negativeZero copySignTo: 1) = -1.
	self assertIsNegativeZero: (-1 copySignTo: 0.0).
	self assertIsPositiveZero: (1 copySignTo: Float negativeZero).