process primitive support
synchronousSignal: aSemaphore 
	"Signal the given semaphore from within the interpreter.
	Answer if the current process was preempted."
	| _gsSqueakTemp_excessSignals |
	(self isEmptyList: aSemaphore)
		ifTrue: ["no process is waiting on this semaphore"
			_gsSqueakTemp_excessSignals := self fetchInteger: ExcessSignalsIndex ofObject: aSemaphore.
			self
				storeInteger: ExcessSignalsIndex
				ofObject: aSemaphore
				withValue: _gsSqueakTemp_excessSignals + 1.
			^ false].
	objectMemory ensureSemaphoreUnforwardedThroughContext: aSemaphore.
	^ self
		resume: (self removeFirstLinkOfList: aSemaphore)
		preemptedYieldingIf: preemptionYields