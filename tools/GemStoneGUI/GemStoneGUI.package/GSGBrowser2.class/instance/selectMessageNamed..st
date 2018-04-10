message list
selectMessageNamed: aSymbol

	currentMethod := (self messageList includes: aSymbol)
		ifFalse: [nil]
		ifTrue: [currentMethod := self methodNamed: aSymbol].
	self hasMessageSelected ifTrue: [self editSelection: #editMessage].
	self invalidateContents.
	self changed: #messageListIndex