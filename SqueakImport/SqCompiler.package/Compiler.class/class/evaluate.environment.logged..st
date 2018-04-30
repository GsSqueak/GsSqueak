evaluating logged
evaluate: aString environment: anEnvironment logged: aBoolean
	^ self new
		evaluateCue: (CompilationCue
			source: aString
			environment: anEnvironment)
		ifFail: [^ nil]
		logged: aBoolean