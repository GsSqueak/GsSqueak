stepping and presenter
step
	(stepNumber := stepNumber + 1) <= nSteps
		ifTrue: [self changed]
		ifFalse: [self completeReplacement]