allocation
allocateBezier
	| _gsSqueakTemp_bezier |
	(self allocateObjEntry: GBBaseSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_bezier := objUsed.
	objUsed := _gsSqueakTemp_bezier + GBBaseSize.
	self objectTypeOf: _gsSqueakTemp_bezier put: GEPrimitiveBezier.
	self objectIndexOf: _gsSqueakTemp_bezier put: 0.
	self objectLengthOf: _gsSqueakTemp_bezier put: GBBaseSize.
	^ _gsSqueakTemp_bezier