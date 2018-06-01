inline primitive generated code
lowcodePrimitiveStoreLocalFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_value := self internalPopStackFloat64.
	stackPages
		floatAtPointer: (self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP)
		put: _gsSqueakTemp_value.
	extA := 0