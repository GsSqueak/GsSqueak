memory space primitives
primitiveSignalAtBytesLeft
	"Set the low-water mark for free space. When the free space falls
	below this level, the new and new: primitives fail and system attempts
	to allocate space (e.g., to create a method context) cause the
	low-space semaphore (if one is registered) to be signalled."
	| _gsSqueakTemp_bytes |
	_gsSqueakTemp_bytes := self stackTop.
	((objectMemory isIntegerObject: _gsSqueakTemp_bytes)
			and: [(_gsSqueakTemp_bytes := objectMemory integerValueOf: _gsSqueakTemp_bytes) >= 0])
		ifTrue: [objectMemory lowSpaceThreshold: _gsSqueakTemp_bytes.
			self pop: 1]
		ifFalse: [self primitiveFailFor: PrimErrBadArgument]