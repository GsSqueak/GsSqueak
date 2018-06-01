process primitive support
doSignalSemaphoreWithIndex: index 
	"Signal the external semaphore with the given index. Answer if a
	context switch
	occurs as a result. Do not bounds check. This has been done in the
	caller. "
	| _gsSqueakTemp_xArray _gsSqueakTemp_sema |
	_gsSqueakTemp_xArray := objectMemory splObj: ExternalObjectsArray.
	self
		assert: (objectMemory isArray: _gsSqueakTemp_xArray).
	_gsSqueakTemp_sema := objectMemory fetchPointer: index - 1 ofObject: _gsSqueakTemp_xArray.
	"Note: semaphore indices are 1-based"
	self assert: (objectMemory isOopForwarded: _gsSqueakTemp_sema) not.
	^ (objectMemory isSemaphoreOop: _gsSqueakTemp_sema)
		and: [self synchronousSignal: _gsSqueakTemp_sema]