as yet unclassified
getItemsSelector: aSymbolOrString

	(nil = aSymbolOrString or:
	 ['nil' = aSymbolOrString or:
	 [aSymbolOrString isEmpty]])
		ifTrue: [^ getItemsSelector := nil].

	getItemsSelector := aSymbolOrString asSymbol.
