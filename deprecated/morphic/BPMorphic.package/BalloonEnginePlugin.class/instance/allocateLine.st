allocation
allocateLine
	| _gsSqueakTemp_line |
	(self allocateObjEntry: GLBaseSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_line := objUsed.
	objUsed := _gsSqueakTemp_line + GLBaseSize.
	self objectTypeOf: _gsSqueakTemp_line put: GEPrimitiveLine.
	self objectIndexOf: _gsSqueakTemp_line put: 0.
	self objectLengthOf: _gsSqueakTemp_line put: GLBaseSize.
	^ _gsSqueakTemp_line