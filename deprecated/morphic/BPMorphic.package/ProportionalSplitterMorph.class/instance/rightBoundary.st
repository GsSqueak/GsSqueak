boundaries
rightBoundary
	"Answer the rightmost x position the receiver could be moved to."
	| _gsSqueakTemp_splitter _gsSqueakTemp_morphs |
	_gsSqueakTemp_splitter := self splitterRight.
	_gsSqueakTemp_morphs := self commonNeighbours: rightOrBottom with: _gsSqueakTemp_splitter.
	^ (_gsSqueakTemp_splitter
		ifNil: [owner isSystemWindow
				ifTrue: [owner panelRect right]
				ifFalse: [owner innerBounds right]]
		ifNotNil: [_gsSqueakTemp_splitter left])
		- (self minimumWidthOf: _gsSqueakTemp_morphs)