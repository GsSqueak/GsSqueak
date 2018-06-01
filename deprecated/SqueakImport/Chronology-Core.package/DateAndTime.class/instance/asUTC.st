ansi protocol
asUTC

	^ self offset isZero
		ifTrue: [self]
		ifFalse: [self utcOffset: 0]
