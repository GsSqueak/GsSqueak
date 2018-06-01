accessing
borderStyle: newStyle 
	| _gsSqueakTemp_newExtent |
	_gsSqueakTemp_newExtent := 2 * newStyle width + image extent.
	bounds extent = _gsSqueakTemp_newExtent
		ifFalse: [super extent: _gsSqueakTemp_newExtent].
	super borderStyle: newStyle