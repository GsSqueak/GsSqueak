simulation support
deny: aBooleanOrBlock 
	aBooleanOrBlock value
		ifTrue: [AssertionFailure signal: 'Assertion failed']