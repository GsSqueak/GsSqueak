timer process
restoreResumptionTimes
	"Private! Restore the resumption times of all scheduled Delays after a snapshot.
	 This method should be called only while the AccessProtect semaphore is held."

	| newBaseTime |
	newBaseTime := Time utcMicrosecondClock.
	SuspendedDelays do:
		[:d | d adjustResumptionTimeOldBase: 0 newBase: newBaseTime].
	ActiveDelay ifNotNil:
		[ActiveDelay adjustResumptionTimeOldBase: 0 newBase: newBaseTime]