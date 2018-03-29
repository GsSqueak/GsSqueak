inline primitive generated code
lowcodePrimitiveLoadLocalInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_value := stackPages
				int64AtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushInt64: _gsSqueakTemp_value.
	extA := 0