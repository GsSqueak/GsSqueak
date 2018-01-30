access
hue
	"Return the hue of this color, an angle in the range [0.0..360.0]."
	| _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_max _gsSqueakTemp_min _gsSqueakTemp_span _gsSqueakTemp_h |
	_gsSqueakTemp_r := self privateRed.
	_gsSqueakTemp_g := self privateGreen.
	_gsSqueakTemp_b := self privateBlue.
	_gsSqueakTemp_max := (_gsSqueakTemp_r max: _gsSqueakTemp_g)
				max: _gsSqueakTemp_b.
	_gsSqueakTemp_min := (_gsSqueakTemp_r min: _gsSqueakTemp_g)
				min: _gsSqueakTemp_b.
	_gsSqueakTemp_span := (_gsSqueakTemp_max - _gsSqueakTemp_min) asFloat.
	_gsSqueakTemp_span = 0.0
		ifTrue: [^ 0.0].
	_gsSqueakTemp_r = _gsSqueakTemp_max
		ifTrue: [_gsSqueakTemp_h := (_gsSqueakTemp_g - _gsSqueakTemp_b) asFloat / _gsSqueakTemp_span * 60.0]
		ifFalse: [_gsSqueakTemp_g = _gsSqueakTemp_max
				ifTrue: [_gsSqueakTemp_h := 120.0 + ((_gsSqueakTemp_b - _gsSqueakTemp_r) asFloat / _gsSqueakTemp_span * 60.0)]
				ifFalse: [_gsSqueakTemp_h := 240.0 + ((_gsSqueakTemp_r - _gsSqueakTemp_g) asFloat / _gsSqueakTemp_span * 60.0)]].
	_gsSqueakTemp_h < 0.0
		ifTrue: [_gsSqueakTemp_h := 360.0 + _gsSqueakTemp_h].
	^ _gsSqueakTemp_h