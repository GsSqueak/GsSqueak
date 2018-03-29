inline primitive generated code
lowcodePrimitiveLoadLocalFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_floatValue := stackPages
				singleFloatAtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushFloat32: _gsSqueakTemp_floatValue.
	extA := 0