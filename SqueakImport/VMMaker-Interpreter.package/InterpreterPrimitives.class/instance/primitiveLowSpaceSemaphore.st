memory space primitives
primitiveLowSpaceSemaphore
	"Register the low-space semaphore. If the argument is not a 
	Semaphore, unregister the current low-space Semaphore."
	| arg |
	arg := self popStack.
	(objectMemory fetchClassOf: arg) = (objectMemory splObj: ClassSemaphore)
		ifTrue: [objectMemory storePointer: TheLowSpaceSemaphore ofObject: objectMemory getSpecialObjectsOop withValue: arg]
		ifFalse: [objectMemory storePointer: TheLowSpaceSemaphore ofObject: objectMemory getSpecialObjectsOop withValue: objectMemory getNilObj]