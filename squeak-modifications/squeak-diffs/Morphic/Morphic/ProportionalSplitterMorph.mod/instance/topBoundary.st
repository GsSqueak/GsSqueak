boundaries
topBoundary
	"Answer the topmost x position the receiver could be moved to."

	| splitter morphs |
	splitter := self splitterAbove.
	morphs := self commonNeighbours: leftOrTop with: splitter.
	
	^ (splitter
		ifNil: [owner isSystemWindow ifTrue: [owner panelRect top]
				ifFalse: [owner innerBounds top]]
		ifNotNil: [splitter bottom])
		+ (self minimumHeightOf: morphs)