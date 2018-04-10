drawing
drawLabelOn: aCanvas 
	| _gsSqueakTemp_stringBounds |
	_gsSqueakTemp_stringBounds := bounds.
	self hasIcon
		ifTrue: [_gsSqueakTemp_stringBounds := _gsSqueakTemp_stringBounds left: _gsSqueakTemp_stringBounds left + self iconForm width + 2].
	self hasMarker
		ifTrue: [_gsSqueakTemp_stringBounds := _gsSqueakTemp_stringBounds left: _gsSqueakTemp_stringBounds left + self submorphBounds width + 8].
	_gsSqueakTemp_stringBounds := _gsSqueakTemp_stringBounds top: _gsSqueakTemp_stringBounds top + _gsSqueakTemp_stringBounds bottom - self fontToUse height // 2.
	aCanvas
		drawString: contents
		in: _gsSqueakTemp_stringBounds
		font: self fontToUse
		color: self colorToUse