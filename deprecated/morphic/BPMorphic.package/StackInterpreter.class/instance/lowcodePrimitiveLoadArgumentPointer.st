inline primitive generated code
lowcodePrimitiveLoadArgumentPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointerResult _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_pointerResult := stackPages
				pointerAtPointer: (self framePointerOfNativeArgument: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushPointer: _gsSqueakTemp_pointerResult.
	extA := 0