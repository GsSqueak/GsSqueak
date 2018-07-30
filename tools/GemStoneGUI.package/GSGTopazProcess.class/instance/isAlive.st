testing
isAlive

	^ self process isAccessible
		and: [self inPipe closed not]
		and: [self outPipe closed not]
		and: [self errPipe closed not]