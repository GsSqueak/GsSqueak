process primitive support
setSignalLowSpaceFlagAndSaveProcess
	"The low space semaphore is about to be signaled. Set the
	signalLowSpace flag,
	and force an interrupt check. Save the currently active process in the
	special objects array so that the low space handler will be able to
	determine the process
	that first triggered a low space condition. The image's low space
	handler is expected
	to nil out the special objects array slot when it handles the low space
	condition. "
	| _gsSqueakTemp_lastSavedProcess _gsSqueakTemp_activeProc |
	DumpStackOnLowSpace ~= 0
		ifTrue: [self printCallStack.
			self printAllStacks].
	objectMemory signalLowSpace: true.
	objectMemory lowSpaceThreshold: 0.
	"disable additional interrupts until lowSpaceThreshold is reset by
	image "
	_gsSqueakTemp_lastSavedProcess := objectMemory splObj: ProcessSignalingLowSpace.
	_gsSqueakTemp_lastSavedProcess = objectMemory nilObject
		ifTrue: [_gsSqueakTemp_activeProc := self activeProcess.
			objectMemory splObj: ProcessSignalingLowSpace put: _gsSqueakTemp_activeProc].
	self forceInterruptCheck