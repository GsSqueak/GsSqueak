process primitive support
checkForInterrupts
	"Check for possible interrupts and handle one if necessary."
	| sema now |
	<inline: false>

	"Mask so same wrapping as primitiveMillisecondClock"
	now := self ioMSecs bitAnd: MillisecondClockMask.

	self interruptCheckForced ifFalse: [
		"don't play with the feedback if we forced a check. It only makes life difficult"
		now - lastTick < interruptChecksEveryNms
			ifTrue: ["wrapping is not a concern, it'll get caught quickly  
				enough. This clause is trying to keep a reasonable  
				guess of how many times per 	interruptChecksEveryNms we are calling  
				quickCheckForInterrupts. Not sure how effective it really is."
				interruptCheckCounterFeedBackReset := interruptCheckCounterFeedBackReset + 10]
			ifFalse: [interruptCheckCounterFeedBackReset <= 1000
					ifTrue: [interruptCheckCounterFeedBackReset := 1000]
					ifFalse: [interruptCheckCounterFeedBackReset := interruptCheckCounterFeedBackReset - 12]]].

	"reset the interrupt check counter"
	interruptCheckCounter := interruptCheckCounterFeedBackReset.

	objectMemory getSignalLowSpace
		ifTrue: [objectMemory setSignalLowSpace: false. "reset flag"
			sema := objectMemory splObj: TheLowSpaceSemaphore.
			sema = objectMemory getNilObj ifFalse: [self synchronousSignal: sema]].

	now < lastTick
		ifTrue: ["millisecond clock wrapped so correct the nextPollTick"
			nextPollTick := nextPollTick - MillisecondClockMask - 1].
	now >= nextPollTick
		ifTrue: [self ioProcessEvents.
			"sets interruptPending if interrupt key pressed"
			nextPollTick := now + 200
			"msecs to wait before next call to ioProcessEvents.  
			Note that strictly speaking we might need to update  
			'now' at this point since ioProcessEvents could take a  
			very long time on some platforms"].
	interruptPending
		ifTrue: [interruptPending := false.
			"reset interrupt flag"
			sema := objectMemory splObj: TheInterruptSemaphore.
			sema = objectMemory getNilObj
				ifFalse: [self synchronousSignal: sema]].

	nextWakeupTick ~= 0
		ifTrue: [now < lastTick
				ifTrue: ["the clock has wrapped. Subtract the wrap  
					interval from nextWakeupTick - this might just  
					possibly result in 0. Since this is used as a flag  
					value for 'no timer' we do the 0 check above"
					nextWakeupTick := nextWakeupTick - MillisecondClockMask - 1].
			now >= nextWakeupTick
				ifTrue: [nextWakeupTick := 0.
					"set timer interrupt to 0 for 'no timer'"
					sema := objectMemory splObj: TheTimerSemaphore.
					sema = objectMemory getNilObj ifFalse: [self synchronousSignal: sema]]].

	"signal any pending finalizations"
	pendingFinalizationSignals > 0
		ifTrue: [sema := objectMemory splObj: TheFinalizationSemaphore.
			(objectMemory fetchClassOf: sema) = (objectMemory splObj: ClassSemaphore)
				ifTrue: [self synchronousSignal: sema].
			pendingFinalizationSignals := 0].

	"signal all semaphores in semaphoresToSignal"
	(semaphoresToSignalCountA > 0 or: [semaphoresToSignalCountB > 0])
		ifTrue: [self signalExternalSemaphores].

	"update the tracking value"
	lastTick := now