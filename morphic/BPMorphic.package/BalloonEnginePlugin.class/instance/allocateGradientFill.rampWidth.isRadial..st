allocation
allocateGradientFill: ramp rampWidth: rampWidth isRadial: isRadial 
	| _gsSqueakTemp_fill _gsSqueakTemp_fillSize _gsSqueakTemp_rampPtr |
	_gsSqueakTemp_fillSize := GGBaseSize + rampWidth.
	(self allocateObjEntry: _gsSqueakTemp_fillSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_fill := objUsed.
	objUsed := _gsSqueakTemp_fill + _gsSqueakTemp_fillSize.
	isRadial
		ifTrue: [self objectTypeOf: _gsSqueakTemp_fill put: GEPrimitiveRadialGradientFill]
		ifFalse: [self objectTypeOf: _gsSqueakTemp_fill put: GEPrimitiveLinearGradientFill].
	self objectIndexOf: _gsSqueakTemp_fill put: 0.
	self objectLengthOf: _gsSqueakTemp_fill put: _gsSqueakTemp_fillSize.
	_gsSqueakTemp_rampPtr := self gradientRampOf: _gsSqueakTemp_fill.
	self hasColorTransform
		ifTrue: [0
				to: rampWidth - 1
				do: [:i | _gsSqueakTemp_rampPtr
						at: i
						put: (self
								transformColor: (ramp at: i))]]
		ifFalse: [0
				to: rampWidth - 1
				do: [:i | _gsSqueakTemp_rampPtr
						at: i
						put: (ramp at: i)]].
	self gradientRampLengthOf: _gsSqueakTemp_fill put: rampWidth.
	^ _gsSqueakTemp_fill