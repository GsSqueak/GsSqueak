new api
evaluate: aString in: environmentProxy notifying: aController logged: logFlag envId: envId

	^ self
		evaluate: aString
		in: nil
		environment: environmentProxy
		notifying: aController
		ifFail: [^nil]
		logged: logFlag
		envId: envId