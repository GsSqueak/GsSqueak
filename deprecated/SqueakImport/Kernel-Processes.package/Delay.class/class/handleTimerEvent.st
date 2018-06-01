timer process
handleTimerEvent
	"Handle a timer event; which can be either:
		- a schedule request (ScheduledDelay notNil)
		- an unschedule request (FinishedDelay notNil)
		- a timer signal (not explicitly specified)
	We check for timer expiry every time we get a signal."
	| nowTick nextTick |
	"Wait until there is work to do."
	TimingSemaphore wait.
	nowTick := Time utcMicrosecondClock.

	"Process any schedule requests"
	ScheduledDelay ifNotNil:
		[self scheduleDelay: ScheduledDelay from: nowTick.
		 ScheduledDelay := nil].

	"Process any unschedule requests"
	FinishedDelay ifNotNil:
		[self unscheduleDelay: FinishedDelay.
		 FinishedDelay := nil].

	"Signal any expired delays"
	[ActiveDelay notNil
	 and: [nowTick >= ActiveDelay resumptionTime]] whileTrue:
		[ActiveDelay signalWaitingProcess.
		 ActiveDelay := SuspendedDelays isEmpty ifFalse:
							[SuspendedDelays removeFirst]].

	"And signal when the next request is due. We sleep at most 1sec here
	 as a soft busy-loop so that we don't accidentally miss signals."
	nextTick := nowTick + 1000000.
	ActiveDelay ifNotNil:
		[nextTick := nextTick min: ActiveDelay resumptionTime].

	"Since we have processed all outstanding requests, reset the timing semaphore so
	 that only new work will wake us up again. Do this RIGHT BEFORE setting the next
	 wakeup call from the VM because it is only signaled once so we mustn't miss it."
	TimingSemaphore initSignals.
	Delay primSignal: TimingSemaphore atUTCMicroseconds: nextTick