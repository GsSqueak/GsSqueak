boundaries
leftBoundary
	"Answer the leftmost y position the receiver could be moved."

	| splitter morphs |
	splitter := self splitterLeft.
	morphs := self commonNeighbours: leftOrTop with: splitter.
	^ (splitter
		ifNil: [owner isSystemWindow ifTrue: [owner panelRect left]
				ifFalse: [owner innerBounds left]]
		ifNotNil: [splitter right])
		 + (self minimumWidthOf: morphs)