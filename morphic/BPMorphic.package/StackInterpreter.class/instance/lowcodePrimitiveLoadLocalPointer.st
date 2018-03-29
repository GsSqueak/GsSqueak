inline primitive generated code
lowcodePrimitiveLoadLocalPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointerResult _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_pointerResult := stackPages
				pointerAtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP).
	self internalPushPointer: _gsSqueakTemp_pointerResult.
	extA := 0