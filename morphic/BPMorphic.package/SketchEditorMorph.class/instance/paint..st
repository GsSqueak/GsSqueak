actions & preps
paint: evt 
	"While the mouse is down, lay down paint, but only within window
	bounds. 11/28/96 sw: no longer stop painting when pen strays out of
	window; once it comes back in, resume painting rather than waiting
	for a mouse up"
	| _gsSqueakTemp_mousePoint _gsSqueakTemp_startRect _gsSqueakTemp_endRect _gsSqueakTemp_startToEnd _gsSqueakTemp_pfPen _gsSqueakTemp_myBrush |
	_gsSqueakTemp_pfPen := self get: #paintingFormPen for: evt.
	_gsSqueakTemp_myBrush := self getBrushFor: evt.
	_gsSqueakTemp_mousePoint := evt cursorPoint.
	_gsSqueakTemp_startRect := _gsSqueakTemp_pfPen location + _gsSqueakTemp_myBrush offset extent: _gsSqueakTemp_myBrush extent.
	_gsSqueakTemp_pfPen goto: _gsSqueakTemp_mousePoint - bounds origin.
	_gsSqueakTemp_endRect := _gsSqueakTemp_pfPen location + _gsSqueakTemp_myBrush offset extent: _gsSqueakTemp_myBrush extent.
	"self render: (startRect merge: endRect).	Show the user what
	happened "
	_gsSqueakTemp_startToEnd := _gsSqueakTemp_startRect merge: _gsSqueakTemp_endRect.
	self
		invalidRect: (_gsSqueakTemp_startToEnd translateBy: bounds origin)