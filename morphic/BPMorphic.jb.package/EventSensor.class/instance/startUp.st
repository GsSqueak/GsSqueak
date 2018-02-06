initialize
startUp
	self initialize.
	self
		primSetInputSemaphore: (Smalltalk registerExternalObject: inputSemaphore).
	self installInterruptWatcher.
	self installEventTickler.
	Smalltalk isMorphic
		ifTrue: [self flushAllButDandDEvents].
	"Attempt to discover whether the input semaphore is actually being
	signaled. "
	hasInputSemaphore := false.
	inputSemaphore initSignals