allocation
allocateWideLine
	| _gsSqueakTemp_line |
	(self allocateObjEntry: GLWideSize)
		ifFalse: [^ 0].
	_gsSqueakTemp_line := objUsed.
	objUsed := _gsSqueakTemp_line + GLWideSize.
	self objectTypeOf: _gsSqueakTemp_line put: GEPrimitiveWideLine.
	self objectIndexOf: _gsSqueakTemp_line put: 0.
	self objectLengthOf: _gsSqueakTemp_line put: GLWideSize.
	^ _gsSqueakTemp_line