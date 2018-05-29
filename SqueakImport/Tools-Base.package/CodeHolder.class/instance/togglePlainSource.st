diffs
togglePlainSource
	"Toggle whether plain source shown in the code pane"
	
	| wasShowingPlainSource |
	self okToChange ifTrue:
		[wasShowingPlainSource := self showingPlainSource.
		self restoreTextualCodingPane.
		wasShowingPlainSource
			ifTrue:
				[self showDocumentation: true]
			ifFalse:
				[contentsSymbol := #source].
		self setContentsToForceRefetch.
		self changed: #contents]

