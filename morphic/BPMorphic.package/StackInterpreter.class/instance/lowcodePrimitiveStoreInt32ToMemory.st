inline primitive generated code
lowcodePrimitiveStoreInt32ToMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self internalPopStackInt32.
	self int32AtPointer: _gsSqueakTemp_pointer put: _gsSqueakTemp_value