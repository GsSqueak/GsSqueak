inline primitive generated code
lowcodePrimitiveLoadUInt64FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self uint64AtPointer: _gsSqueakTemp_pointer.
	self internalPushInt64: _gsSqueakTemp_value