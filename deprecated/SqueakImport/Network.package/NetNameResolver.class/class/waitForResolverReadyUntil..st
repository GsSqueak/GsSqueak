private
waitForResolverReadyUntil: deadline
	"Wait until deadline for the resolver to be ready to accept a new request. Return true if the resolver is not busy, false if the network is not initialized or the resolver has not become free within the given time period."

	| status millisecondsLeft |
	(status := self resolverStatus) = ResolverUninitialized ifTrue: [ ^false ].
	[ status = ResolverBusy
	  and: [millisecondsLeft := (deadline - Time utcMicrosecondClock) // 1000.
		   millisecondsLeft > 0 ] ]
		whileTrue: "wait for resolver to be available"
			[ ResolverSemaphore waitTimeoutMSecs: millisecondsLeft.
			  status := self resolverStatus ].
	^status ~= ResolverBusy