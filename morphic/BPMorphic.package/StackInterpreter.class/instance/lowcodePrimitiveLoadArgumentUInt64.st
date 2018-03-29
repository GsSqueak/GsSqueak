inline primitive generated code
lowcodePrimitiveLoadArgumentUInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_value := stackPages
				uint64AtPointer: (self framePointerOfNativeArgument: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushInt64: _gsSqueakTemp_value.
	extA := 0