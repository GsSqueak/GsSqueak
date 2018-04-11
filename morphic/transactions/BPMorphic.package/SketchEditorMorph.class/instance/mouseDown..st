morphic
mouseDown: evt 
	"Start a new stroke. Check if any palette setting have changed.
	6/11/97 20:30 tk"
	"verify that we are in a good state"
	| _gsSqueakTemp_cur _gsSqueakTemp_pfPen _gsSqueakTemp_myAction |
	self verifyState: evt.
	"includes prepareToPaint and #scalingOrRotate"
	_gsSqueakTemp_pfPen := self get: #paintingFormPen for: evt.
	paintingForm extent = undoBuffer extent
		ifTrue: [paintingForm
				displayOn: undoBuffer
				at: 0 @ 0
				rule: Form over]
		ifFalse: [undoBuffer := paintingForm deepCopy].
	_gsSqueakTemp_pfPen place: evt cursorPoint - bounds origin.
	_gsSqueakTemp_myAction := self getActionFor: evt.
	palette colorable
		ifTrue: [palette
				recentColor: (self getColorFor: evt)].
	self
		set: #strokeOrigin
		for: evt
		to: evt cursorPoint.
	"origin point for pickup: rect: ellispe: polygon: line: star:. Always take it."
	_gsSqueakTemp_myAction == #pickup:
		ifTrue: [_gsSqueakTemp_cur := Cursor corner shallowCopy.
			_gsSqueakTemp_cur offset: 0 @ 0.
			"cur offset abs"
			evt hand showTemporaryCursor: _gsSqueakTemp_cur].
	_gsSqueakTemp_myAction == #polygon:
		ifTrue: [self polyNew: evt].
	"a mode lets you drag vertices"
	self mouseMove: evt