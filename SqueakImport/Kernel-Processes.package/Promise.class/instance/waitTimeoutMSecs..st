waiting
waitTimeoutMSecs: msecs
	"Wait for at most the given number of milliseconds for this promise to settle.
	Answer true if it is resolved, false otherwise. False can therefore mean EITHER 'timeout' OR 'rejected'."
	| sema delay |
	sema := Semaphore new.
	self whenResolved: [sema signal].
	self whenRejected: [sema signal].
	delay := Delay timeoutSemaphore: sema afterMSecs: msecs.
	[sema wait] ensure: [delay unschedule].
	^ self isResolved.