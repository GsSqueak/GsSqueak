inline primitive generated code
lowcodePrimitiveStoreInt64ToMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self internalPopStackInt64.
	self int64AtPointer: _gsSqueakTemp_pointer put: _gsSqueakTemp_value