printing
defaultNameStemForInstances
	^ self = SimpleButtonMorph
		ifTrue: ['Button']
		ifFalse: [^ super defaultNameStemForInstances]