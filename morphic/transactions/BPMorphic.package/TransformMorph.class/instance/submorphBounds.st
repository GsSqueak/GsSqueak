layout
submorphBounds
	"Answer, in owner coordinates, the bounds of my visible submorphs, or
	my bounds"
	| _gsSqueakTemp_box |
	_gsSqueakTemp_box := self localVisibleSubmorphBounds.
	^ (_gsSqueakTemp_box
		ifNil: [self bounds]
		ifNotNil: [transform localBoundsToGlobal: _gsSqueakTemp_box]) truncated