boundaries
rightBoundary
	"Answer the rightmost x position the receiver could be moved to."

	| splitter morphs |
	splitter := self splitterRight.
	morphs := self commonNeighbours: rightOrBottom with: splitter.
	
	^ (splitter
		ifNil: [owner isSystemWindow ifTrue: [owner panelRect right]
				ifFalse: [owner innerBounds right]]
		ifNotNil: [splitter left])
		- (self minimumWidthOf: morphs)