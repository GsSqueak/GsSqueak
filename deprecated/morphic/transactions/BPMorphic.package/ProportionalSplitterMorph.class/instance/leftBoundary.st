boundaries
leftBoundary
	"Answer the leftmost y position the receiver could be moved."
	| _gsSqueakTemp_splitter _gsSqueakTemp_morphs |
	_gsSqueakTemp_splitter := self splitterLeft.
	_gsSqueakTemp_morphs := self commonNeighbours: leftOrTop with: _gsSqueakTemp_splitter.
	^ (_gsSqueakTemp_splitter
		ifNil: [owner isSystemWindow
				ifTrue: [owner panelRect left]
				ifFalse: [owner innerBounds left]]
		ifNotNil: [_gsSqueakTemp_splitter right])
		+ (self minimumWidthOf: _gsSqueakTemp_morphs)