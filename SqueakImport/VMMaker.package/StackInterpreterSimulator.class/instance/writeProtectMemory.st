debug printing
writeProtectMemory
	objectMemory setMemory: (ReadOnlyArrayWrapper around: objectMemory getMemory)