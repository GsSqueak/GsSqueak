private
scaledAlphaMix: theta of: lastWord with: nextWord 
	"Open-coded version of alpha mixing two 32bit pixel words and
	returning the scaled pixel value."
	| _gsSqueakTemp_word0 _gsSqueakTemp_word1 _gsSqueakTemp_a0 _gsSqueakTemp_a1 _gsSqueakTemp_alpha _gsSqueakTemp_v0 _gsSqueakTemp_v1 _gsSqueakTemp_vv _gsSqueakTemp_value |
	_gsSqueakTemp_word0 := lastWord.
	_gsSqueakTemp_word1 := nextWord.
	"note: extract alpha first so we'll be in SmallInteger range afterwards"
	_gsSqueakTemp_a0 := _gsSqueakTemp_word0 bitShift: -24.
	_gsSqueakTemp_a1 := _gsSqueakTemp_word1 bitShift: -24.
	_gsSqueakTemp_alpha := _gsSqueakTemp_a0 + (_gsSqueakTemp_a1 - _gsSqueakTemp_a0 * theta) truncated.
	"Now make word0 and word1 SmallIntegers"
	_gsSqueakTemp_word0 := _gsSqueakTemp_word0 bitAnd: 16777215.
	_gsSqueakTemp_word1 := _gsSqueakTemp_word1 bitAnd: 16777215.
	"Compute first component value"
	_gsSqueakTemp_v0 := _gsSqueakTemp_word0 bitAnd: 255.
	_gsSqueakTemp_v1 := _gsSqueakTemp_word1 bitAnd: 255.
	_gsSqueakTemp_vv := _gsSqueakTemp_v0 + (_gsSqueakTemp_v1 - _gsSqueakTemp_v0 * theta) truncated * _gsSqueakTemp_alpha // 255.
	_gsSqueakTemp_value := _gsSqueakTemp_vv.
	"Compute second component value"
	_gsSqueakTemp_v0 := (_gsSqueakTemp_word0 bitShift: -8)
				bitAnd: 255.
	_gsSqueakTemp_v1 := (_gsSqueakTemp_word1 bitShift: -8)
				bitAnd: 255.
	_gsSqueakTemp_vv := _gsSqueakTemp_v0 + (_gsSqueakTemp_v1 - _gsSqueakTemp_v0 * theta) truncated * _gsSqueakTemp_alpha // 255.
	_gsSqueakTemp_value := _gsSqueakTemp_value
				bitOr: (_gsSqueakTemp_vv bitShift: 8).
	"Compute third component value"
	_gsSqueakTemp_v0 := (_gsSqueakTemp_word0 bitShift: -16)
				bitAnd: 255.
	_gsSqueakTemp_v1 := (_gsSqueakTemp_word1 bitShift: -16)
				bitAnd: 255.
	_gsSqueakTemp_vv := _gsSqueakTemp_v0 + (_gsSqueakTemp_v1 - _gsSqueakTemp_v0 * theta) truncated * _gsSqueakTemp_alpha // 255.
	_gsSqueakTemp_value := _gsSqueakTemp_value
				bitOr: (_gsSqueakTemp_vv bitShift: 16).
	"Return result"
	^ _gsSqueakTemp_value
		bitOr: (_gsSqueakTemp_alpha bitShift: 24)