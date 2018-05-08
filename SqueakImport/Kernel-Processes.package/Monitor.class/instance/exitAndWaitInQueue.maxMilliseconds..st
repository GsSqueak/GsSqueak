private
exitAndWaitInQueue: anOrderedCollection maxMilliseconds: anIntegerOrNil

	[ | lock |
	 lock := queuesMutex critical: [ anOrderedCollection addLast: Semaphore new ].
	 self primitiveExitCriticalSection.
	 anIntegerOrNil 
		ifNil: [ lock wait 	]
		ifNotNil:
			[ | delay |
			 delay := MonitorDelay 
				signalLock: lock
				afterMSecs: anIntegerOrNil
				inMonitor: self
				queue: anOrderedCollection.
			 [ lock wait ] ensure: [ delay unschedule ] ] ]
		ensure: [ self primitiveEnterCriticalSection ]