diffs
showDiffs: aBoolean
	"Set whether I'm showing diffs as indicated; use the global preference to determine which kind of diffs to institute."

	self showingAnyKindOfDiffs
		ifFalse:
			[aBoolean ifTrue:
				[contentsSymbol := self defaultDiffsSymbol]]
		ifTrue:
			[aBoolean ifFalse:
				[contentsSymbol := #source]].
	self setContentsToForceRefetch.
	self contentsChanged