contexts
fetchContextRegisters: activeCntx 
	"Note: internalFetchContextRegisters: should track changes  to this method."
	| tmp |
	<inline: true>
	tmp := objectMemory fetchPointer: MethodIndex ofObject: activeCntx.
	(objectMemory isIntegerObject: tmp)
		ifTrue: ["if the MethodIndex field is an integer, activeCntx is a block context"
			tmp := objectMemory fetchPointer: HomeIndex ofObject: activeCntx.
			(objectMemory oop: tmp isLessThan: objectMemory getYoungStart) ifTrue: [objectMemory beRootIfOld: tmp]]
		ifFalse: ["otherwise, it is a method context and is its own home context "
			tmp := activeCntx].
	theHomeContext := tmp.
	receiver := objectMemory fetchPointer: ReceiverIndex ofObject: tmp.
	method := objectMemory fetchPointer: MethodIndex ofObject: tmp.

	"the instruction pointer is a pointer variable equal to 
	method oop + ip + objectMemory baseHeaderSize 
	-1 for 0-based addressing of fetchByte 
	-1 because it gets incremented BEFORE fetching currentByte "
	tmp := self quickFetchInteger: InstructionPointerIndex ofObject: activeCntx.
	instructionPointer := method + tmp + objectMemory baseHeaderSize - 2.

	"the stack pointer is a pointer variable also..."
	tmp := self quickFetchInteger: StackPointerIndex ofObject: activeCntx.
	stackPointer := activeCntx + objectMemory baseHeaderSize + (TempFrameStart + tmp - 1 * objectMemory bytesPerWord)