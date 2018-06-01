squeak protocol
asMilliSeconds

	nanos = 0 ifTrue: [ ^seconds * 1000 ].
	^nanos // 1000000 + (seconds * 1000)