menu
addBorderToShape: evt 
	| _gsSqueakTemp_str _gsSqueakTemp_borderWidth _gsSqueakTemp_borderedForm _gsSqueakTemp_r |
	_gsSqueakTemp_str := UIManager default request: 'Please enter the desired border width' translated initialAnswer: '0'.
	_gsSqueakTemp_borderWidth := Integer
				readFrom: (ReadStream on: _gsSqueakTemp_str).
	(_gsSqueakTemp_borderWidth between: 1 and: 10)
		ifFalse: [^ self].
	"Take care of growing appropriately. Does this lose the reg point?"
	_gsSqueakTemp_borderedForm := originalForm shapeBorder: Color black width: _gsSqueakTemp_borderWidth.
	_gsSqueakTemp_r := _gsSqueakTemp_borderedForm rectangleEnclosingPixelsNotOfColor: Color transparent.
	self
		form: (_gsSqueakTemp_borderedForm copy: _gsSqueakTemp_r)