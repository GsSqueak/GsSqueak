boundaries
topBoundary
	"Answer the topmost x position the receiver could be moved to."
	| _gsSqueakTemp_splitter _gsSqueakTemp_morphs |
	_gsSqueakTemp_splitter := self splitterAbove.
	_gsSqueakTemp_morphs := self commonNeighbours: leftOrTop with: _gsSqueakTemp_splitter.
	^ (_gsSqueakTemp_splitter
		ifNil: [owner isSystemWindow
				ifTrue: [owner panelRect top]
				ifFalse: [owner innerBounds top]]
		ifNotNil: [_gsSqueakTemp_splitter bottom])
		+ (self minimumHeightOf: _gsSqueakTemp_morphs)