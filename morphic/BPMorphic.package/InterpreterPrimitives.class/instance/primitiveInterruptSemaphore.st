I/O primitives
primitiveInterruptSemaphore
	"Register the user interrupt semaphore. If the argument is 
	not a Semaphore, unregister the current interrupt 
	semaphore."
	| _gsSqueakTemp_arg |
	_gsSqueakTemp_arg := self stackTop.
	(_gsSqueakTemp_arg = objectMemory nilObject
			or: [objectMemory isSemaphoreOop: _gsSqueakTemp_arg])
		ifTrue: [objectMemory splObj: TheInterruptSemaphore put: _gsSqueakTemp_arg.
			self pop: 1]
		ifFalse: [self primitiveFailFor: PrimErrBadArgument]