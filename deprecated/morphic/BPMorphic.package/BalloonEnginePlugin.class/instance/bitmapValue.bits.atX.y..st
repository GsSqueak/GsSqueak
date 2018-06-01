fills-bitmaps
bitmapValue: bmFill bits: bits atX: xp y: yp 
	| _gsSqueakTemp_bmDepth _gsSqueakTemp_bmRaster _gsSqueakTemp_value _gsSqueakTemp_rShift _gsSqueakTemp_cMask _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_a |
	_gsSqueakTemp_bmDepth := self bitmapDepthOf: bmFill.
	_gsSqueakTemp_bmRaster := self bitmapRasterOf: bmFill.
	_gsSqueakTemp_bmDepth = 32
		ifTrue: [_gsSqueakTemp_value := (self cCoerce: bits to: 'int*')
						at: _gsSqueakTemp_bmRaster * yp + xp.
			(_gsSqueakTemp_value ~= 0
					and: [(_gsSqueakTemp_value bitAnd: 4278190080)
							= 0])
				ifTrue: [_gsSqueakTemp_value := _gsSqueakTemp_value bitOr: 4278190080].
			^ self uncheckedTransformColor: _gsSqueakTemp_value].
	"rShift - shift value to convert from pixel to word index"
	_gsSqueakTemp_rShift := self rShiftTable at: _gsSqueakTemp_bmDepth.
	_gsSqueakTemp_value := self
				makeUnsignedFrom: ((self cCoerce: bits to: 'int*')
						at: _gsSqueakTemp_bmRaster * yp + (xp >> _gsSqueakTemp_rShift)).
	"cMask - mask out the pixel from the word"
	_gsSqueakTemp_cMask := 1 << _gsSqueakTemp_bmDepth - 1.
	"rShift - shift value to move the pixel in the word to the lowest bit
	position "
	_gsSqueakTemp_rShift := 32 - _gsSqueakTemp_bmDepth - ((xp bitAnd: 1 << _gsSqueakTemp_rShift - 1)
					* _gsSqueakTemp_bmDepth).
	_gsSqueakTemp_value := _gsSqueakTemp_value >> _gsSqueakTemp_rShift bitAnd: _gsSqueakTemp_cMask.
	_gsSqueakTemp_bmDepth = 16
		ifTrue: ["Must convert by expanding bits"
			_gsSqueakTemp_value = 0
				ifFalse: [_gsSqueakTemp_b := (_gsSqueakTemp_value bitAnd: 31)
								<< 3.
					_gsSqueakTemp_b := _gsSqueakTemp_b + (_gsSqueakTemp_b >> 5).
					_gsSqueakTemp_g := (_gsSqueakTemp_value >> 5 bitAnd: 31)
								<< 3.
					_gsSqueakTemp_g := _gsSqueakTemp_g + (_gsSqueakTemp_g >> 5).
					_gsSqueakTemp_r := (_gsSqueakTemp_value >> 10 bitAnd: 31)
								<< 3.
					_gsSqueakTemp_r := _gsSqueakTemp_r + (_gsSqueakTemp_r >> 5).
					_gsSqueakTemp_a := 255.
					_gsSqueakTemp_value := _gsSqueakTemp_b + (_gsSqueakTemp_g << 8) + (_gsSqueakTemp_r << 16) + (_gsSqueakTemp_a << 24)]]
		ifFalse: ["Must convert by using color map"
			(self bitmapCmSizeOf: bmFill)
					= 0
				ifTrue: [_gsSqueakTemp_value := 0]
				ifFalse: [_gsSqueakTemp_value := self
								makeUnsignedFrom: ((self colormapOf: bmFill)
										at: _gsSqueakTemp_value)]].
	^ self uncheckedTransformColor: _gsSqueakTemp_value