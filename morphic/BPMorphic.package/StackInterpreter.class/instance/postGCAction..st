object memory support
postGCAction: gcModeArg 
	"Signal the gc semaphore, and inform the display subsystem if the
	display bitmap has moved."
	self signalSemaphoreWithIndex: gcSemaphoreIndex.
	self postGCUpdateDisplayBits