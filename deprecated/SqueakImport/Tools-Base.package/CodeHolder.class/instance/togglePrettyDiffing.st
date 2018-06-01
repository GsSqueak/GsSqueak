diffs
togglePrettyDiffing
	"Toggle whether pretty-diffing should be shown in the code pane"

	| wasShowingDiffs |
	self okToChange ifTrue:
		[wasShowingDiffs := self showingPrettyDiffs.
		self restoreTextualCodingPane.
		self showPrettyDiffs: wasShowingDiffs not.
		self setContentsToForceRefetch.
		self contentsChanged]

