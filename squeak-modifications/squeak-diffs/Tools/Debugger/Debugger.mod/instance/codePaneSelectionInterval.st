code pane
codePaneSelectionInterval

	^ self codeTextMorph
		ifNotNil: [:cp | cp selectionInterval]
		ifNil: [Interval from: 0 to: 0]