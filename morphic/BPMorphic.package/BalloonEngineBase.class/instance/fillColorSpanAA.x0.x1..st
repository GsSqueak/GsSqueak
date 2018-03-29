displaying
fillColorSpanAA: pixelValue32 x0: leftX x1: rightX 
	"This is the inner loop for solid color fills with anti-aliasing.
	This loop has been unrolled for speed and quality into three parts:
	a) copy all pixels that fall into the first full pixel.
	b) copy aaLevel pixels between the first and the last full pixel
	c) copy all pixels that fall in the last full pixel"
	| _gsSqueakTemp_colorMask _gsSqueakTemp_baseShift _gsSqueakTemp_x _gsSqueakTemp_idx _gsSqueakTemp_firstPixel _gsSqueakTemp_lastPixel _gsSqueakTemp_aaLevel _gsSqueakTemp_pv32 |
	"Not now -- maybe later"
	"Compute the pixel boundaries."
	_gsSqueakTemp_firstPixel := self aaFirstPixelFrom: leftX to: rightX.
	_gsSqueakTemp_lastPixel := self aaLastPixelFrom: leftX to: rightX.
	_gsSqueakTemp_aaLevel := self aaLevelGet.
	_gsSqueakTemp_baseShift := self aaShiftGet.
	_gsSqueakTemp_x := leftX.
	"Part a: Deal with the first n sub-pixels"
	_gsSqueakTemp_x < _gsSqueakTemp_firstPixel
		ifTrue: [_gsSqueakTemp_pv32 := (pixelValue32 bitAnd: self aaColorMaskGet)
						>> self aaColorShiftGet.
			[_gsSqueakTemp_x < _gsSqueakTemp_firstPixel]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_pv32.
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1]].
	"Part b: Deal with the full pixels"
	_gsSqueakTemp_x < _gsSqueakTemp_lastPixel
		ifTrue: [_gsSqueakTemp_colorMask := self aaColorMaskGet >> self aaShiftGet bitOr: 4042322160.
			_gsSqueakTemp_pv32 := (pixelValue32 bitAnd: _gsSqueakTemp_colorMask)
						>> self aaShiftGet.
			[_gsSqueakTemp_x < _gsSqueakTemp_lastPixel]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_pv32.
					_gsSqueakTemp_x := _gsSqueakTemp_x + _gsSqueakTemp_aaLevel]].
	"Part c: Deal with the last n sub-pixels"
	_gsSqueakTemp_x < rightX
		ifTrue: [_gsSqueakTemp_pv32 := (pixelValue32 bitAnd: self aaColorMaskGet)
						>> self aaColorShiftGet.
			[_gsSqueakTemp_x < rightX]
				whileTrue: [_gsSqueakTemp_idx := _gsSqueakTemp_x >> _gsSqueakTemp_baseShift.
					spanBuffer at: _gsSqueakTemp_idx put: (spanBuffer at: _gsSqueakTemp_idx)
							+ _gsSqueakTemp_pv32.
					_gsSqueakTemp_x := _gsSqueakTemp_x + 1]]