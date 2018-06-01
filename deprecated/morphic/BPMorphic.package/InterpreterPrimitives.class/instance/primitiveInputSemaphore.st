I/O primitives
primitiveInputSemaphore
	"Register the input semaphore. If the argument is not a 
	Semaphore, unregister the current input semaphore."
	| _gsSqueakTemp_arg |
	_gsSqueakTemp_arg := self stackTop.
	(objectMemory isIntegerObject: _gsSqueakTemp_arg)
		ifTrue: ["If arg is integer, then use it as an index 
			into the external objects array and install it 
			as the new event semaphore"
			self
				ioSetInputSemaphore: (objectMemory integerValueOf: _gsSqueakTemp_arg).
			self successful
				ifTrue: [self pop: 1].
			^ nil].
	"old code for compatibility"
	TheInputSemaphore = nil
		ifTrue: [^ self primitiveFail].
	(_gsSqueakTemp_arg = objectMemory nilObject
			or: [objectMemory isSemaphoreOop: _gsSqueakTemp_arg])
		ifTrue: [objectMemory splObj: TheInputSemaphore put: _gsSqueakTemp_arg.
			self pop: 1]
		ifFalse: [self primitiveFailFor: PrimErrBadArgument]