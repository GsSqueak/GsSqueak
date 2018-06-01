allocation
allocateBitmapFill: cmSize colormap: cmBits 
	| _gsSqueakTemp_fill _gsSqueakTemp_fillSize _gsSqueakTemp_cm |
	_gsSqueakTemp_fillSize := GBMBaseSize + cmSize.
	(self allocateObjEntry: _gsSqueakTemp_fillSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_fill := objUsed.
	objUsed := _gsSqueakTemp_fill + _gsSqueakTemp_fillSize.
	self objectTypeOf: _gsSqueakTemp_fill put: GEPrimitiveClippedBitmapFill.
	self objectIndexOf: _gsSqueakTemp_fill put: 0.
	self objectLengthOf: _gsSqueakTemp_fill put: _gsSqueakTemp_fillSize.
	_gsSqueakTemp_cm := self colormapOf: _gsSqueakTemp_fill.
	self hasColorTransform
		ifTrue: [0
				to: cmSize - 1
				do: [:i | _gsSqueakTemp_cm
						at: i
						put: (self
								transformColor: (cmBits at: i))]]
		ifFalse: [0
				to: cmSize - 1
				do: [:i | _gsSqueakTemp_cm
						at: i
						put: (cmBits at: i)]].
	self bitmapCmSizeOf: _gsSqueakTemp_fill put: cmSize.
	^ _gsSqueakTemp_fill