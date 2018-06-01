diffs
toggleRegularDiffing
	"Toggle whether regular-diffing should be shown in the code pane"

	| wasShowingDiffs |
	self okToChange ifTrue:
		[wasShowingDiffs := self showingRegularDiffs.
		self restoreTextualCodingPane.
		self showRegularDiffs: wasShowingDiffs not.
		self setContentsToForceRefetch.
		self contentsChanged]

