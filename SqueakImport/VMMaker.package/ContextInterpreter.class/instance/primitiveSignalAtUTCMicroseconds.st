system control primitives
primitiveSignalAtUTCMicroseconds
	"Cause the time semaphore, if one has been registered, to be
	 signalled when the microsecond clock is greater than or equal to
	 the given tick value. A tick value of zero turns off timer interrupts."

	"Provided for compatibility with StackInterpreter microsecond implementation.
	This is a required primitive in some newer images, and is implemented here
	with millisecond precision only."

	| tick sema usecsObj now usecs |
	<var: #usecs type: #usqLong>
	<var: #now type: #usqLong>
	usecsObj := self popStack.
	sema := self popStack.
	usecs := self positive64BitValueOf: usecsObj.
	now := self ioUTCMicroseconds.
	tick := lastTick + (self cCoerce: usecs - now + 500 / 1000 to: #sqInt). "add 500 for rounding"
	self successful
		ifTrue: [(objectMemory fetchClassOf: sema) = (objectMemory splObj: ClassSemaphore)
				ifTrue: [objectMemory
						storePointer: TheTimerSemaphore
						ofObject: objectMemory getSpecialObjectsOop
						withValue: sema.
					nextWakeupTick := tick]
				ifFalse: [objectMemory
						storePointer: TheTimerSemaphore
						ofObject: objectMemory getSpecialObjectsOop
						withValue: objectMemory getNilObj.
					nextWakeupTick := 0]]
		ifFalse: [self unPop: 2]