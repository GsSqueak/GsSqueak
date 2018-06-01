transforming
uncheckedTransformColor: fillIndex 
	| _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_a _gsSqueakTemp_transform |
	self hasColorTransform
		ifFalse: [^ fillIndex].
	_gsSqueakTemp_b := fillIndex bitAnd: 255.
	_gsSqueakTemp_g := fillIndex >> 8 bitAnd: 255.
	_gsSqueakTemp_r := fillIndex >> 16 bitAnd: 255.
	_gsSqueakTemp_a := fillIndex >> 24 bitAnd: 255.
	_gsSqueakTemp_transform := self colorTransform.
	_gsSqueakTemp_r := (_gsSqueakTemp_r
				* (_gsSqueakTemp_transform at: 0)
				+ (_gsSqueakTemp_transform at: 1)) asInteger.
	_gsSqueakTemp_g := (_gsSqueakTemp_g
				* (_gsSqueakTemp_transform at: 2)
				+ (_gsSqueakTemp_transform at: 3)) asInteger.
	_gsSqueakTemp_b := (_gsSqueakTemp_b
				* (_gsSqueakTemp_transform at: 4)
				+ (_gsSqueakTemp_transform at: 5)) asInteger.
	_gsSqueakTemp_a := (_gsSqueakTemp_a
				* (_gsSqueakTemp_transform at: 6)
				+ (_gsSqueakTemp_transform at: 7)) asInteger.
	_gsSqueakTemp_r := _gsSqueakTemp_r max: 0.
	_gsSqueakTemp_r := _gsSqueakTemp_r min: 255.
	_gsSqueakTemp_g := _gsSqueakTemp_g max: 0.
	_gsSqueakTemp_g := _gsSqueakTemp_g min: 255.
	_gsSqueakTemp_b := _gsSqueakTemp_b max: 0.
	_gsSqueakTemp_b := _gsSqueakTemp_b min: 255.
	_gsSqueakTemp_a := _gsSqueakTemp_a max: 0.
	_gsSqueakTemp_a := _gsSqueakTemp_a min: 255.
	_gsSqueakTemp_a < 16
		ifTrue: [^ 0].
	"ALWAYS return zero for transparent fills"
	^ _gsSqueakTemp_b + (_gsSqueakTemp_g << 8) + (_gsSqueakTemp_r << 16) + (_gsSqueakTemp_a << 24)