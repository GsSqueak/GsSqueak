allocation
allocateWideBezier
	| _gsSqueakTemp_bezier |
	(self allocateObjEntry: GBWideSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_bezier := objUsed.
	objUsed := _gsSqueakTemp_bezier + GBWideSize.
	self objectTypeOf: _gsSqueakTemp_bezier put: GEPrimitiveWideBezier.
	self objectIndexOf: _gsSqueakTemp_bezier put: 0.
	self objectLengthOf: _gsSqueakTemp_bezier put: GBWideSize.
	^ _gsSqueakTemp_bezier