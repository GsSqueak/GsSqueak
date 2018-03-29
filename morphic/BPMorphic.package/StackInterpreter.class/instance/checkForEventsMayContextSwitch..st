process primitive support
checkForEventsMayContextSwitch: mayContextSwitch 
	"Check for possible interrupts and handle one if necessary.
	Answer if a context switch has occurred."
	| _gsSqueakTemp_switched _gsSqueakTemp_sema _gsSqueakTemp_now |
	statCheckForEvents := statCheckForEvents + 1.
	"restore the stackLimit if it has been smashed."
	self restoreStackLimit.
	self externalWriteBackHeadFramePointers.
	self assert: stackPage = stackPages mostRecentlyUsedPage.
	"Allow the platform to do anything it needs to do synchronously."
	self ioSynchronousCheckForEvents.
	self checkCogCompiledCodeCompactionCalledFor.
	objectMemory needGCFlag
		ifTrue: ["sufficientSpaceAfterGC: runs the incremental GC and
			then, if not enough space is available, the fullGC."
			(objectMemory sufficientSpaceAfterGC: 0)
				ifFalse: [self setSignalLowSpaceFlagAndSaveProcess]].
	mayContextSwitch
		ifFalse: [^ false].
	_gsSqueakTemp_switched := false.
	(profileProcess ~= objectMemory nilObject
			or: [nextProfileTick > 0
					and: [self ioHighResClock >= nextProfileTick]])
		ifTrue: [nextProfileTick := 0.
			"Take a sample (if not already done so) for the profiler if it is
			active. This
			must be done before any of the synchronousSignals below or
			else we will
			attribute a pause in ioRelinquishProcessor to the newly
			activated process."
			profileProcess = objectMemory nilObject
				ifTrue: [profileProcess := self activeProcess.
					profileMethod := objectMemory nilObject].
			"and signal the profiler semaphore if it is present"
			(profileSemaphore ~= objectMemory nilObject
					and: [self synchronousSignal: profileSemaphore])
				ifTrue: [_gsSqueakTemp_switched := true]].
	self checkDeliveryOfLongRunningPrimitiveSignal
		ifTrue: [_gsSqueakTemp_switched := true].
	objectMemory signalLowSpace
		ifTrue: [objectMemory signalLowSpace: false.
			"reset flag"
			_gsSqueakTemp_sema := objectMemory splObj: TheLowSpaceSemaphore.
			(_gsSqueakTemp_sema ~= objectMemory nilObject
					and: [self synchronousSignal: _gsSqueakTemp_sema])
				ifTrue: [_gsSqueakTemp_switched := true]].
	"inIOProcessEvents prevents reentrancy into ioProcessEvents and
	allows disabling
	ioProcessEvents e.g. for native GUIs. We would like to manage that
	here but can't
	since the platform code may choose to call ioProcessEvents itself in
	various places."
	false
		ifTrue: [((_gsSqueakTemp_now := self ioUTCMicroseconds) >= nextPollUsecs
					and: [inIOProcessEvents = 0])
				ifTrue: [statIOProcessEvents := statIOProcessEvents + 1.
					inIOProcessEvents := inIOProcessEvents + 1.
					self ioProcessEvents.
					"sets interruptPending if interrupt key pressed; may
					callback "
					inIOProcessEvents > 0
						ifTrue: [inIOProcessEvents := inIOProcessEvents - 1].
					nextPollUsecs := _gsSqueakTemp_now + 20000
					"msecs to wait before next call to ioProcessEvents.
					Note that strictly
					speaking we might need to update 'now' at this point
					since ioProcessEvents could take a very long time on
					some platforms"]]
		ifFalse: [(_gsSqueakTemp_now := self ioUTCMicroseconds) >= nextPollUsecs
				ifTrue: [statIOProcessEvents := statIOProcessEvents + 1.
					self ioProcessEvents.
					"sets interruptPending if interrupt key pressed; may
					callback "
					nextPollUsecs := _gsSqueakTemp_now + 20000
					"msecs to wait before next call to ioProcessEvents.
					Note that strictly
					speaking we might need to update 'now' at this point
					since ioProcessEvents could take a very long time on
					some platforms"]].
	interruptPending
		ifTrue: [interruptPending := false.
			"reset interrupt flag"
			_gsSqueakTemp_sema := objectMemory splObj: TheInterruptSemaphore.
			(_gsSqueakTemp_sema ~= objectMemory nilObject
					and: [self synchronousSignal: _gsSqueakTemp_sema])
				ifTrue: [_gsSqueakTemp_switched := true]].
	nextWakeupUsecs ~= 0
		ifTrue: [_gsSqueakTemp_now >= nextWakeupUsecs
				ifTrue: [nextWakeupUsecs := 0.
					"set timer interrupt to 0 for 'no timer'"
					_gsSqueakTemp_sema := objectMemory splObj: TheTimerSemaphore.
					(_gsSqueakTemp_sema ~= objectMemory nilObject
							and: [self synchronousSignal: _gsSqueakTemp_sema])
						ifTrue: [_gsSqueakTemp_switched := true]]].
	"signal any pending finalizations"
	pendingFinalizationSignals > 0
		ifTrue: [pendingFinalizationSignals := 0.
			_gsSqueakTemp_sema := objectMemory splObj: TheFinalizationSemaphore.
			(_gsSqueakTemp_sema ~= objectMemory nilObject
					and: [self synchronousSignal: _gsSqueakTemp_sema])
				ifTrue: [_gsSqueakTemp_switched := true]].
	"signal all semaphores in semaphoresToSignal"
	self signalExternalSemaphores
		ifTrue: [_gsSqueakTemp_switched := true].
	^ _gsSqueakTemp_switched