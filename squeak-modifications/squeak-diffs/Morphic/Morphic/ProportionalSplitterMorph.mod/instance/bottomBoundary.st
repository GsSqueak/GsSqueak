boundaries
bottomBoundary
	"Answert the bottommost x position the receiver could be moved."

	| splitter morphs |
	splitter := self splitterBelow.
	morphs := self commonNeighbours: rightOrBottom with: splitter.
	^ (splitter
		ifNil: [owner isSystemWindow ifTrue: [owner panelRect bottom]
				ifFalse: [owner innerBounds bottom]]
		ifNotNil: [splitter top])
		- (self minimumHeightOf: morphs)