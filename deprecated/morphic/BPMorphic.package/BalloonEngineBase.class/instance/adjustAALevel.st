displaying
adjustAALevel
	"NOTE: This method is (hopefully) obsolete due to unrolling 
	the fill loops to deal with full pixels."
	"Adjust the span buffers values by the appropriate color offset for
	anti-aliasing. We do this by replicating the top bits of each color in the
	lower bits. The idea is that we can scale each color value uniquely
	from 0 to 255 and thus fill the entire range of colors."
	| _gsSqueakTemp_adjustShift _gsSqueakTemp_adjustMask _gsSqueakTemp_x0 _gsSqueakTemp_x1 _gsSqueakTemp_pixelValue |
	_gsSqueakTemp_adjustShift := 8 - self aaColorShiftGet.
	_gsSqueakTemp_adjustMask := self aaColorMaskGet bitInvert32.
	_gsSqueakTemp_x0 := self spanStartGet >> self aaShiftGet.
	_gsSqueakTemp_x1 := self spanEndGet >> self aaShiftGet.
	[_gsSqueakTemp_x0 < _gsSqueakTemp_x1]
		whileTrue: [_gsSqueakTemp_pixelValue := spanBuffer at: _gsSqueakTemp_x0.
			spanBuffer
				at: _gsSqueakTemp_x0
				put: (_gsSqueakTemp_pixelValue
						bitOr: (_gsSqueakTemp_pixelValue >> _gsSqueakTemp_adjustShift bitAnd: _gsSqueakTemp_adjustMask)).
			_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 1]