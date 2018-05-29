accessing
actionSelector: aSymbolOrString

	(nil = aSymbolOrString or:
	 ['nil' = aSymbolOrString or:
	 [aSymbolOrString isEmpty]])
		ifTrue: [^ setValueSelector := nil].

	setValueSelector := aSymbolOrString asSymbol.
