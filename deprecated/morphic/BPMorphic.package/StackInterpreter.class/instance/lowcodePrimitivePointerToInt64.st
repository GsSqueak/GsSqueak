inline primitive generated code
lowcodePrimitivePointerToInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_result |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_pointer to: 'uintptr_t'.
	self internalPushInt64: _gsSqueakTemp_result