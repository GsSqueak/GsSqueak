system control primitives
primitiveSignalAtMilliseconds
	"Cause the time semaphore, if one has been registered, to
	be signalled when the millisecond clock is greater than or
	equal to the given tick value. A tick value of zero turns off
	timer interrupts."
	| tick sema |
	tick := self popInteger.
	sema := self popStack.
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