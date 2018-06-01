private
waitForCompletionUntil: deadline
	"Wait until deadline for the resolver to be ready to accept a new request.
	 Return true if the resolver is ready, false if the network is not initialized or
	 the resolver has not become free within the given time period."

	| status millisecondsLeft |
	status := self resolverStatus.
	[ status = ResolverBusy
	  and: [millisecondsLeft := (deadline - Time utcMicrosecondClock) // 1000.
		   millisecondsLeft > 0 ] ]
		whileTrue: "wait for resolver to be available"
			[ ResolverSemaphore waitTimeoutMSecs: millisecondsLeft.
			status := self resolverStatus ].
	status = ResolverReady ifTrue: [ ^true ].
	status = ResolverBusy ifTrue: [ self primAbortLookup ].
	^false