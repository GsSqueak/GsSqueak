actions & preps
flipHoriz: evt 
	"Flip the image"
	| _gsSqueakTemp_temp _gsSqueakTemp_myBuff |
	_gsSqueakTemp_myBuff := self get: #buff for: evt.
	_gsSqueakTemp_temp := _gsSqueakTemp_myBuff deepCopy flipBy: #horizontal centerAt: _gsSqueakTemp_myBuff center.
	_gsSqueakTemp_temp offset: 0 @ 0.
	paintingForm fillWithColor: Color transparent.
	_gsSqueakTemp_temp displayOn: paintingForm at: paintingForm center - _gsSqueakTemp_myBuff center + _gsSqueakTemp_myBuff offset.
	rotationButton position: evt cursorPoint x - 6 @ rotationButton position y.
	self render: bounds