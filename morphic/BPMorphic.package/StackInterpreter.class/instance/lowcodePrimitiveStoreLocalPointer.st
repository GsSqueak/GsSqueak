inline primitive generated code
lowcodePrimitiveStoreLocalPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointerValue _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_pointerValue := self internalPopStackPointer.
	stackPages
		pointerAtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP)
		put: _gsSqueakTemp_pointerValue.
	extA := 0