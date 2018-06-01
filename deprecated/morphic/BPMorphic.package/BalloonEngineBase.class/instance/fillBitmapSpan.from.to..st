displaying
fillBitmapSpan: bits from: leftX to: rightX 
	"Fill the span buffer between leftEdge and rightEdge using the given
	bits. Note: We always start from zero - this avoids using huge bitmap
	buffers if the bitmap is to be displayed at the very far right hand side
	and also gives us a chance of using certain bitmaps (e.g., those with
	depth 32) directly."
	| _gsSqueakTemp_x0 _gsSqueakTemp_x1 _gsSqueakTemp_x _gsSqueakTemp_bitX _gsSqueakTemp_colorMask _gsSqueakTemp_colorShift _gsSqueakTemp_baseShift _gsSqueakTemp_fillValue |
	_gsSqueakTemp_x0 := leftX.
	_gsSqueakTemp_x1 := rightX.
	_gsSqueakTemp_bitX := -1.
	"Hack for pre-increment"
	self aaLevelGet = 1
		ifTrue: ["Speedy version for no anti-aliasing"
			[_gsSqueakTemp_x0 < _gsSqueakTemp_x1]
				whileTrue: [_gsSqueakTemp_fillValue := (self cCoerce: bits to: 'int *')
								at: (_gsSqueakTemp_bitX := _gsSqueakTemp_bitX + 1).
					spanBuffer at: _gsSqueakTemp_x0 put: _gsSqueakTemp_fillValue.
					_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 1]]
		ifFalse: ["Generic version with anti-aliasing"
			_gsSqueakTemp_colorMask := self aaColorMaskGet.
			_gsSqueakTemp_colorShift := self aaColorShiftGet.
			_gsSqueakTemp_baseShift := self aaShiftGet.
			[_gsSqueakTemp_x0 < _gsSqueakTemp_x1]
				whileTrue: [_gsSqueakTemp_x := _gsSqueakTemp_x0 >> _gsSqueakTemp_baseShift.
					_gsSqueakTemp_fillValue := (self cCoerce: bits to: 'int *')
								at: (_gsSqueakTemp_bitX := _gsSqueakTemp_bitX + 1).
					_gsSqueakTemp_fillValue := (_gsSqueakTemp_fillValue bitAnd: _gsSqueakTemp_colorMask)
								>> _gsSqueakTemp_colorShift.
					spanBuffer at: _gsSqueakTemp_x put: (spanBuffer at: _gsSqueakTemp_x)
							+ _gsSqueakTemp_fillValue.
					_gsSqueakTemp_x0 := _gsSqueakTemp_x0 + 1]].
	_gsSqueakTemp_x1 > self spanEndGet
		ifTrue: [self spanEndPut: _gsSqueakTemp_x1].
	_gsSqueakTemp_x1 > self spanEndAAGet
		ifTrue: [self spanEndAAPut: _gsSqueakTemp_x1]