jump bytecodes
jump: offset

	localIP := localIP + offset + 1.
	currentBytecode := objectMemory byteAtPointer: localIP.
