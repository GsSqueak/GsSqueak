inline primitive generated code
lowcodePrimitiveLoadLocalAddress
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_pointer := self framePointerOfNativeLocal: _gsSqueakTemp_baseOffset in: localFP.
	self internalPushPointer: _gsSqueakTemp_pointer.
	extA := 0