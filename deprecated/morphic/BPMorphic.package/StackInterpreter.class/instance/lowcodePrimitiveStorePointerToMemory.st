inline primitive generated code
lowcodePrimitiveStorePointerToMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_memoryPointer _gsSqueakTemp_pointerValue |
	_gsSqueakTemp_memoryPointer := self internalPopStackPointer.
	_gsSqueakTemp_pointerValue := self internalPopStackPointer.
	self pointerAtPointer: _gsSqueakTemp_memoryPointer put: _gsSqueakTemp_pointerValue