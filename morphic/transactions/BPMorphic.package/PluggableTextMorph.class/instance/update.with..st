updating
update: aSymbol with: arg1 
	aSymbol == #editString
		ifTrue: [self editString: arg1.
			self hasUnacceptedEdits: true].
	(aSymbol == #inputRequested
			and: [self getTextSelector == arg1
					or: [self setTextSelector == arg1]])
		ifTrue: [self activeHand newKeyboardFocus: self].
	^ super update: aSymbol with: arg1