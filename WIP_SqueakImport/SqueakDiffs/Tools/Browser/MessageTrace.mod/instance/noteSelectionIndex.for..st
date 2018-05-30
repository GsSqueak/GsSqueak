accessing
noteSelectionIndex: anInteger for: aSymbol
	aSymbol == #messageList
		ifTrue:
			[ messageListIndex := anInteger.
			self 
				messageAt: messageListIndex
				beSelected: true ].
	super
		noteSelectionIndex: anInteger
		for: aSymbol