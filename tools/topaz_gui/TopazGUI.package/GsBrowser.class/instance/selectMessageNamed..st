message list
selectMessageNamed: aSymbolOrString

	| name |
	name := aSymbolOrString ifNotNil: [aSymbolOrString asSymbol].
	selectedMessageName := name.

	self changed: #messageListIndex. "update my selection"