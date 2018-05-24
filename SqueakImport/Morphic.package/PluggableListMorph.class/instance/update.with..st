updating
update: aSymbol with: arg1

	(aSymbol == #inputRequested and: [getIndexSelector == arg1 or: [setIndexSelector == arg1]])
		ifTrue: [self activeHand newKeyboardFocus: self].
		
	super update: aSymbol with: arg1.