memory space primitives
primitiveLowSpaceSemaphore
	"Register the low-space semaphore. If the argument is not a 
	Semaphore, unregister the current low-space Semaphore."
	| _gsSqueakTemp_arg |
	_gsSqueakTemp_arg := self stackTop.
	(_gsSqueakTemp_arg = objectMemory nilObject
			or: [objectMemory isSemaphoreOop: _gsSqueakTemp_arg])
		ifTrue: [objectMemory splObj: TheLowSpaceSemaphore put: _gsSqueakTemp_arg.
			self pop: 1]
		ifFalse: [self primitiveFailFor: PrimErrBadArgument]