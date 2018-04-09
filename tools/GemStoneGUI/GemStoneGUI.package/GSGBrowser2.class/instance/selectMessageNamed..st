message list
selectMessageNamed: aSymbol

	currentMethod := (self messageList includes: aSymbol)
		ifFalse: [nil]
		ifTrue: [currentMethod := self selectedClassOrMetaClass
									methodAt: aSymbol
									environmentId: self envId
									ifAbsent: [nil]].
	self hasMessageSelected ifTrue: [self editSelection: #editMessage].
	self invalidateContents.
	self changed: #messageListIndex