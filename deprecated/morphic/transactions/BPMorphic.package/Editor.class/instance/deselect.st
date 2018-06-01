current selection
deselect
	"If the text selection is visible on the screen, reverse its highlight."
	selectionShowing
		ifTrue: [self reverseSelection]