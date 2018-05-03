object memory support
markAndTraceInterpreterOops: fullGCFlag
	"Mark and trace all oops in the interpreter's state."
	"Assume: All traced variables contain valid oops."
	| oop |
	self compilerMarkHook.
	objectMemory markAndTrace: objectMemory getSpecialObjectsOop. "also covers nilObj, trueObj, falseObj, and compact classes"
	compilerInitialized
		ifTrue: [objectMemory markAndTrace: receiver.
			objectMemory markAndTrace: method]
		ifFalse: [objectMemory markAndTrace: activeContext].
	objectMemory markAndTrace: messageSelector.
	objectMemory markAndTrace: newMethod.
	objectMemory markAndTrace: methodClass.
	objectMemory markAndTrace: lkupClass.
	objectMemory markAndTrace: receiverClass.
	1 to: objectMemory getRemapBufferCount do: [:i | 
			oop := objectMemory remapBufferAt: i.
			(objectMemory isIntegerObject: oop) ifFalse: [objectMemory markAndTrace: oop]].

	"Callback support - trace suspended callback list"
	1 to: jmpDepth do:[:i|
		oop := suspendedCallbacks at: i.
		(objectMemory isIntegerObject: oop) ifFalse:[objectMemory markAndTrace: oop].
		oop := suspendedMethods at: i.
		(objectMemory isIntegerObject: oop) ifFalse:[objectMemory markAndTrace: oop].
	].
