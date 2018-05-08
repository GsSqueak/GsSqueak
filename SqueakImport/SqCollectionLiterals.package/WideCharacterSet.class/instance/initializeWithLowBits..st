initialize-release
initializeWithLowBits: lowBits

	bitsetCapacity := 1 bitShift: lowBits.
	highBitsShift := 0 - lowBits.
	lowBitsMask := bitsetCapacity - 1.
	
