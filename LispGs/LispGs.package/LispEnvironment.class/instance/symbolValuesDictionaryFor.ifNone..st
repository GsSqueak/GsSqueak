as yet unclassified
symbolValuesDictionaryFor: aSymbol ifNone: aBlock 
	(self bindsSymbol: aSymbol)
		ifTrue: [^ self symbolValues].
	^ (upperBindings
		ifNil: [^ aBlock value])
		symbolValuesDictionaryFor: aSymbol
		ifNone: aBlock