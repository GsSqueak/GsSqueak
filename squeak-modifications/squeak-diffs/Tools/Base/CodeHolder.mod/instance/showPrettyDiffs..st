diffs
showPrettyDiffs: aBoolean
	"Set whether I'm showing pretty diffs as indicated"

	self showingPrettyDiffs
		ifFalse:
			[aBoolean ifTrue:
				[contentsSymbol := #prettyDiffs]]
		ifTrue:
			[aBoolean ifFalse:
				[contentsSymbol := #source]].
	self setContentsToForceRefetch.
	self contentsChanged