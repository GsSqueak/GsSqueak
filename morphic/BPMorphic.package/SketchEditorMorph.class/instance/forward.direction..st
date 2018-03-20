actions & preps
forward: evt direction: button 
	"Move the forward direction arrow of this painting. When the user
	says forward:, the object moves in the direction of the arrow. evt may
	be an Event (from the user moving the arrow), or an initial number
	ofdegrees. "
	| _gsSqueakTemp_center _gsSqueakTemp_dir _gsSqueakTemp_ww _gsSqueakTemp_ff |
	_gsSqueakTemp_center := bounds center.
	"+ (rotationButton width - 6 @ 0)"
	_gsSqueakTemp_dir := evt isNumber
				ifTrue: [Point r: 100 degrees: evt - 90.0
					"convert to 0 on X axis"]
				ifFalse: [evt cursorPoint - _gsSqueakTemp_center].
	_gsSqueakTemp_ww := (bounds height min: bounds width)
				// 2 - 7.
	button
		setVertices: (Array with: _gsSqueakTemp_center
					+ (Point r: _gsSqueakTemp_ww degrees: _gsSqueakTemp_dir degrees) with: _gsSqueakTemp_center
					+ (Point r: _gsSqueakTemp_ww - 15 degrees: _gsSqueakTemp_dir degrees)).
	(_gsSqueakTemp_ff := self valueOfProperty: #fwdToggle) position: _gsSqueakTemp_center
			+ (Point r: _gsSqueakTemp_ww - 7 degrees: _gsSqueakTemp_dir degrees + 6.5) - (_gsSqueakTemp_ff extent // 2).
	self showDirType