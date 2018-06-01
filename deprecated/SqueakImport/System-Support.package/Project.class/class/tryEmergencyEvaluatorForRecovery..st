error recovery
tryEmergencyEvaluatorForRecovery: errorMessage

	| hasTranscripter transcripter |
	hasTranscripter := (Smalltalk classNamed: #Transcripter)
		ifNotNil: [ :t | transcripter := t. true]
		ifNil: [false].
	(String
		streamContents: 
			[:s |
			| context |
			s nextPutAll: '***System error handling failed***'.
			s cr; nextPutAll: errorMessage.
			context := thisContext sender sender.
			20 timesRepeat: [context == nil ifFalse: [s cr; print: (context := context sender)]].
			s cr; nextPutAll: '-------------------------------'.
			hasTranscripter
				ifTrue: [
					s cr; nextPutAll: 'Type CR to enter an emergency evaluator.'.
					s cr; nextPutAll: 'Type any other character to restart.']
				ifFalse: [
					s cr; nextPutAll: 'Type any character to restart.']])
		displayAt: 0 @ 0.

	[Sensor keyboardPressed] whileFalse.

	Sensor keyboard = Character cr ifTrue: [
		hasTranscripter ifTrue: [transcripter emergencyEvaluator]].