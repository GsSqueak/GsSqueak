as yet unclassified
symbolValueBinding: aSymbol 
	(self symbolBinding: aSymbol)
		ifNotNil: [:b | ^ b].
	^ (upperBindings
		ifNil: [^ nil])
		symbolValueBinding: aSymbol