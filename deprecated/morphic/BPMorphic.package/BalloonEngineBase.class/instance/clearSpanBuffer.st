displaying
clearSpanBuffer
	"Clear the current span buffer.
	The span buffer is only cleared in the area that has been used by the
	previous scan line."
	| _gsSqueakTemp_x0 _gsSqueakTemp_x1 |
	_gsSqueakTemp_x0 := self spanStartGet >> self aaShiftGet.
	_gsSqueakTemp_x1 := self spanEndGet >> self aaShiftGet + 1.
	_gsSqueakTemp_x0 < 0
		ifTrue: [_gsSqueakTemp_x0 := 0].
	_gsSqueakTemp_x1 > self spanSizeGet
		ifTrue: [_gsSqueakTemp_x1 := self spanSizeGet].
	[_gsSqueakTemp_x0 < _gsSqueakTemp_x1]
		whileTrue: [spanBuffer at: _gsSqueakTemp_x0 put: 0.
			_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 1].
	self spanStartPut: self spanSizeGet.
	self spanEndPut: 0