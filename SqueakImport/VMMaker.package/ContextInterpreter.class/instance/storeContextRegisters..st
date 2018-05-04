contexts
storeContextRegisters: activeCntx
	"Note: internalStoreContextRegisters: should track changes to this method."

	"InstructionPointer is a pointer variable equal to
	method oop + ip + objectMemory baseHeaderSize
		-1 for 0-based addressing of fetchByte
		-1 because it gets incremented BEFORE fetching currentByte"

	<inline: true>
	objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: activeCntx
		withValue: (objectMemory integerObjectOf: (instructionPointer - method - (objectMemory baseHeaderSize - 2))).
	objectMemory storePointerUnchecked: StackPointerIndex ofObject: activeCntx
		withValue: (objectMemory integerObjectOf: (self stackPointerIndex - TempFrameStart + 1)).
