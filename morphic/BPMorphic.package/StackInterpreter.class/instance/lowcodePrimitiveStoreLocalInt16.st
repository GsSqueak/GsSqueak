inline primitive generated code
lowcodePrimitiveStoreLocalInt16
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_value := self internalPopStackInt32.
	stackPages
		int16AtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP)
		put: _gsSqueakTemp_value.
	extA := 0