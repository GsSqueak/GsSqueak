highlighting
highlightedTab
	^ self tabMorphs detect: [:m | m isHighlighted] ifNone: [nil]