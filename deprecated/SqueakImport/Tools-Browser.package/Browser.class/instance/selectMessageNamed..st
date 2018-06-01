message list
selectMessageNamed: aSymbolOrString
	| name |
	name := aSymbolOrString ifNotNil: [ aSymbolOrString asSymbol ].
	selectedMessageName := name.

	self editSelection: (name notNil
		ifTrue: [#editMessage]
		ifFalse: [self messageCategoryListIndex > 0
			ifTrue: [#newMessage]
			ifFalse: [self hasClassSelected
				ifTrue: [#editClass]
				ifFalse: [#newClass]]]).
	contents := nil.
	self changed: #messageListIndex. "update my selection"
	self contentsChanged.
	self decorateButtons.