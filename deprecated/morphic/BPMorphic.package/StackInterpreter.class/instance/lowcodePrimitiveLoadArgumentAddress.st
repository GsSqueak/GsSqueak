inline primitive generated code
lowcodePrimitiveLoadArgumentAddress
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_baseOffset |
	_gsSqueakTemp_baseOffset := extA.
	_gsSqueakTemp_pointer := self framePointerOfNativeArgument: _gsSqueakTemp_baseOffset in: localFP.
	self internalPushPointer: _gsSqueakTemp_pointer.
	extA := 0