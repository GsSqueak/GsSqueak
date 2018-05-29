finalization
finalize

	self primSocketDestroyGently: socketHandle.
	Smalltalk unregisterExternalObjects: {
		semaphore.
		readSemaphore.
		writeSemaphore }
