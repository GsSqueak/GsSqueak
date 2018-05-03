object memory support
mapInterpreterOops
	"Map all oops in the interpreter's state to their new values 
	during garbage collection or a become: operation."
	"Assume: All traced variables contain valid oops."
	| oop |
	objectMemory mapRootObjects.
	compilerInitialized
		ifFalse: [stackPointer := stackPointer - activeContext. "*rel to active"
			activeContext := objectMemory remap: activeContext.
			stackPointer := stackPointer + activeContext. "*rel to active"
			theHomeContext := objectMemory remap: theHomeContext].
	instructionPointer := instructionPointer - method. "*rel to method"
	method := objectMemory remap: method.
	instructionPointer := instructionPointer + method. "*rel to method"
	receiver := objectMemory remap: receiver.
	messageSelector := objectMemory remap: messageSelector.
	newMethod := objectMemory remap: newMethod.
	methodClass := objectMemory remap: methodClass.
	lkupClass := objectMemory remap: lkupClass.
	receiverClass := objectMemory remap: receiverClass.
	1 to: objectMemory getRemapBufferCount do: [:i | 
			oop := objectMemory remapBufferAt: i.
			(objectMemory isIntegerObject: oop)
				ifFalse: [objectMemory remapBufferAt: i put: (objectMemory remap: oop)]].

	"Callback support - trace suspended callback list"
	1 to: jmpDepth do:[:i|
		oop := suspendedCallbacks at: i.
		(objectMemory isIntegerObject: oop) 
			ifFalse:[suspendedCallbacks at: i put: (objectMemory remap: oop)].
		oop := suspendedMethods at: i.
		(objectMemory isIntegerObject: oop) 
			ifFalse:[suspendedMethods at: i put: (objectMemory remap: oop)].
	].
