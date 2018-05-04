contexts
internalFetchContextRegisters: activeCntx
	"Inlined into return bytecodes. The only difference between this method and fetchContextRegisters: is that this method sets the local IP and SP."

	| tmp |
	<inline: true>
	tmp := objectMemory fetchPointer: MethodIndex ofObject: activeCntx.
	(objectMemory isIntegerObject: tmp) ifTrue: [
		"if the MethodIndex field is an integer, activeCntx is a block context"
		tmp := objectMemory fetchPointer: HomeIndex ofObject: activeCntx.
		(objectMemory oop: tmp isLessThan: objectMemory getYoungStart) ifTrue: [ objectMemory beRootIfOld: tmp ].
	] ifFalse: [
		"otherwise, it is a method context and is its own home context"
		tmp := activeCntx.
	].
	localHomeContext := tmp.
	receiver := objectMemory fetchPointer: ReceiverIndex ofObject: tmp.
	method := objectMemory fetchPointer: MethodIndex ofObject: tmp.

	"the instruction pointer is a pointer variable equal to
		method oop + ip + objectMemory baseHeaderSize
		  -1 for 0-based addressing of fetchByte
		  -1 because it gets incremented BEFORE fetching currentByte"
	tmp := self quickFetchInteger: InstructionPointerIndex ofObject: activeCntx.
	localIP := objectMemory pointerForOop: method + tmp + objectMemory baseHeaderSize - 2.

	"the stack pointer is a pointer variable also..."
	tmp := self quickFetchInteger: StackPointerIndex ofObject: activeCntx.
	localSP := objectMemory pointerForOop: activeCntx + objectMemory baseHeaderSize + ((TempFrameStart + tmp - 1) * objectMemory bytesPerWord)