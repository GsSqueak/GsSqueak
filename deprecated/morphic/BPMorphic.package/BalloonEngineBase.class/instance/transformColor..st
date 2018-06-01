transforming
transformColor: fillIndex 
	| _gsSqueakTemp_r _gsSqueakTemp_g _gsSqueakTemp_b _gsSqueakTemp_a _gsSqueakTemp_transform _gsSqueakTemp_alphaScale |
	(fillIndex = 0
			or: [self isFillColor: fillIndex])
		ifFalse: [^ fillIndex].
	_gsSqueakTemp_b := fillIndex bitAnd: 255.
	_gsSqueakTemp_g := fillIndex >> 8 bitAnd: 255.
	_gsSqueakTemp_r := fillIndex >> 16 bitAnd: 255.
	_gsSqueakTemp_a := fillIndex >> 24 bitAnd: 255.
	self hasColorTransform
		ifTrue: [_gsSqueakTemp_transform := self colorTransform.
			_gsSqueakTemp_alphaScale := _gsSqueakTemp_a
						* (_gsSqueakTemp_transform at: 6)
						+ (_gsSqueakTemp_transform at: 7) / _gsSqueakTemp_a.
			_gsSqueakTemp_r := (_gsSqueakTemp_r
						* (_gsSqueakTemp_transform at: 0)
						+ (_gsSqueakTemp_transform at: 1) * _gsSqueakTemp_alphaScale) asInteger.
			_gsSqueakTemp_g := (_gsSqueakTemp_g
						* (_gsSqueakTemp_transform at: 2)
						+ (_gsSqueakTemp_transform at: 3) * _gsSqueakTemp_alphaScale) asInteger.
			_gsSqueakTemp_b := (_gsSqueakTemp_b
						* (_gsSqueakTemp_transform at: 4)
						+ (_gsSqueakTemp_transform at: 5) * _gsSqueakTemp_alphaScale) asInteger.
			_gsSqueakTemp_a := _gsSqueakTemp_a * _gsSqueakTemp_alphaScale.
			_gsSqueakTemp_r := _gsSqueakTemp_r max: 0.
			_gsSqueakTemp_r := _gsSqueakTemp_r min: 255.
			_gsSqueakTemp_g := _gsSqueakTemp_g max: 0.
			_gsSqueakTemp_g := _gsSqueakTemp_g min: 255.
			_gsSqueakTemp_b := _gsSqueakTemp_b max: 0.
			_gsSqueakTemp_b := _gsSqueakTemp_b min: 255.
			_gsSqueakTemp_a := _gsSqueakTemp_a max: 0.
			_gsSqueakTemp_a := _gsSqueakTemp_a min: 255].
	_gsSqueakTemp_a < 1
		ifTrue: [^ 0].
	"ALWAYS return zero for transparent fills"
	"If alpha is not 255 (or close thereto) then we need to flush the engine
	before proceeding"
	(_gsSqueakTemp_a < 255
			and: [self needsFlush])
		ifTrue: [self stopBecauseOf: GErrorNeedFlush].
	^ _gsSqueakTemp_b + (_gsSqueakTemp_g << 8) + (_gsSqueakTemp_r << 16) + (_gsSqueakTemp_a << 24)