diffs
restoreTextualCodingPane
	"If the receiver is showing tiles, restore the textual coding pane"

	contentsSymbol == #tiles ifTrue:
		[contentsSymbol := #source.
		self installTextualCodingPane]