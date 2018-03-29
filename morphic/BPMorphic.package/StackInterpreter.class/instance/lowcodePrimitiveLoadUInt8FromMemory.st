inline primitive generated code
lowcodePrimitiveLoadUInt8FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self uint8AtPointer: _gsSqueakTemp_pointer.
	self internalPushInt32: _gsSqueakTemp_value