boundaries
bottomBoundary
	"Answert the bottommost x position the receiver could be moved."
	| _gsSqueakTemp_splitter _gsSqueakTemp_morphs |
	_gsSqueakTemp_splitter := self splitterBelow.
	_gsSqueakTemp_morphs := self commonNeighbours: rightOrBottom with: _gsSqueakTemp_splitter.
	^ (_gsSqueakTemp_splitter
		ifNil: [owner isSystemWindow
				ifTrue: [owner panelRect bottom]
				ifFalse: [owner innerBounds bottom]]
		ifNotNil: [_gsSqueakTemp_splitter top])
		- (self minimumHeightOf: _gsSqueakTemp_morphs)