selection
selectionIndex: idx
	"Called internally to select the index-th item."
	| theMorph index |
	idx ifNil: [^ self].
	index := idx min: scroller submorphs size max: 0.
	(theMorph := index = 0 ifTrue: [nil] ifFalse: [scroller submorphs at: index])
		ifNotNil: [self scrollToShow: theMorph bounds].
	self selectedMorph: theMorph