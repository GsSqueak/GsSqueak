-Ocompletion
createCompletionController
	^ (ECPreferences useECompletionInsteadOfOCompletion
		ifTrue: [ECController]
		ifFalse: [OController])
		model: self