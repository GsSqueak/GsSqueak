inline primitive generated code
lowcodePrimitiveLoadLocalFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_doubleValue _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_doubleValue := stackPages
				floatAtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushFloat64: _gsSqueakTemp_doubleValue.
	extA := 0