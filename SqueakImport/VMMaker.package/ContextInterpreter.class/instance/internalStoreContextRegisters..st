contexts
internalStoreContextRegisters: activeCntx
	"The only difference between this method and fetchContextRegisters: is that this method stores from the local IP and SP."

	"InstructionPointer is a pointer variable equal to
	method oop + ip + objectMemory baseHeaderSize
		-1 for 0-based addressing of fetchByte
		-1 because it gets incremented BEFORE fetching currentByte"

	<inline: true>
	objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: activeCntx
		withValue: (objectMemory integerObjectOf: 
			((objectMemory oopForPointer: localIP) + 2 - (method + objectMemory baseHeaderSize))).
	objectMemory storePointerUnchecked: StackPointerIndex		  ofObject: activeCntx
		withValue: (objectMemory integerObjectOf:
			((((objectMemory oopForPointer: localSP) - (activeCntx + objectMemory baseHeaderSize)) >> objectMemory shiftForWord) - TempFrameStart + 1)).
