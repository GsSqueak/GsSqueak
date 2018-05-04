float primitives
storeFloatAt: floatBitsAddress from: aFloat.

	objectMemory long32At: floatBitsAddress put: (aFloat at: 1).
	objectMemory long32At: floatBitsAddress+4 put: (aFloat at: 2).
