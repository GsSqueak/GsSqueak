accessing
methodDict
	methodDict == nil ifTrue: [self recoverFromMDFaultWithTrace].
	^ methodDict