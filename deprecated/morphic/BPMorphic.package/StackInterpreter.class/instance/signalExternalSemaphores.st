process primitive support
signalExternalSemaphores
	"Signal all requested semaphores. Answer if a context switch has
	occurred. "
	| _gsSqueakTemp_xArray |
	_gsSqueakTemp_xArray := objectMemory splObj: ExternalObjectsArray.
	^ self
		doSignalExternalSemaphores: (objectMemory numSlotsOf: _gsSqueakTemp_xArray)