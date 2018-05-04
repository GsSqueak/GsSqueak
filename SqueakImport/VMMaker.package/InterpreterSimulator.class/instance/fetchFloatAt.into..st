float primitives
fetchFloatAt: floatBitsAddress into: aFloat

	aFloat at: 1 put: (objectMemory long32At: floatBitsAddress).
	aFloat at: 2 put: (objectMemory long32At: floatBitsAddress+4).
