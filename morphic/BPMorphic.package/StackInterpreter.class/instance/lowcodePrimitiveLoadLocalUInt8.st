inline primitive generated code
lowcodePrimitiveLoadLocalUInt8
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_value := stackPages
				uint8AtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushInt32: _gsSqueakTemp_value.
	extA := 0