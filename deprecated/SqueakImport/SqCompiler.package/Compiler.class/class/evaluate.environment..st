evaluating
evaluate: aString environment: anEnvironment
	^  self new
		evaluateCue: (CompilationCue
			source: aString
			environment: anEnvironment)
		ifFail: [^ nil]