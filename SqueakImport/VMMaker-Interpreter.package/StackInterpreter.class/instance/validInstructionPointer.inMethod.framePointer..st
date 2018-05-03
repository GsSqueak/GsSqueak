debug support
validInstructionPointer: instrPointer inMethod: aMethod framePointer: fp
	<var: #instrPointer type: #usqInt>
	<var: #aMethod type: #usqInt>
	^instrPointer >= (aMethod + (objectMemory lastPointerOf: aMethod) + self bytesPerWord - 1)
	  and: [instrPointer < (aMethod + (objectMemory byteLengthOf: aMethod) + objectMemory baseHeaderSize)]