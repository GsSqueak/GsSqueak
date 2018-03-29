inline primitive generated code
lowcodePrimitiveLoadInt64FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self int64AtPointer: _gsSqueakTemp_pointer.
	self internalPushInt64: _gsSqueakTemp_value