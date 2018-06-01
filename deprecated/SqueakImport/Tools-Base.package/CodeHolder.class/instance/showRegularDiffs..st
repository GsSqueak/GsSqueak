diffs
showRegularDiffs: aBoolean
	"Set whether I'm showing regular diffs as indicated"

	self showingRegularDiffs
		ifFalse:
			[aBoolean ifTrue:
				[contentsSymbol := #showDiffs]]
		ifTrue:
			[aBoolean ifFalse:
				[contentsSymbol := #source]].
	self setContentsToForceRefetch.
	self contentsChanged