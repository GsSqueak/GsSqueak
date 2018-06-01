diffs
togglePrettyPrint
	"Toggle whether pretty-print is in effectin the code pane"

	self restoreTextualCodingPane.
	self okToChange ifTrue:
		[self showingPrettyPrint
			ifTrue:
				[contentsSymbol := #source]
			ifFalse:
				[contentsSymbol := #prettyPrint].
		self setContentsToForceRefetch.
		self contentsChanged]

