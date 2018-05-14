as yet unclassified
symbolValuesDictionaryFor: aSymbol 
	"look-up for the dictionary in which a value binding for aSymbol should
	be stored"
	((self symbolValues includesKey: aSymbol)
			or: [upperBindings isNil])
		ifTrue: [^ self symbolValues].
	^ upperBindings symbolValuesDictionaryFor: aSymbol