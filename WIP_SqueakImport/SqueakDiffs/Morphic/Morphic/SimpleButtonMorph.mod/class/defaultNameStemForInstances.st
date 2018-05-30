printing
defaultNameStemForInstances
	^ self = SimpleButtonMorph
		ifTrue: ['Button' translatedNoop]
		ifFalse: [^ super defaultNameStemForInstances]