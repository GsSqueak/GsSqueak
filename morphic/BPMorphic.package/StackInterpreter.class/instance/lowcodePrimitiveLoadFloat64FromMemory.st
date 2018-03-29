inline primitive generated code
lowcodePrimitiveLoadFloat64FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self floatAtPointer: _gsSqueakTemp_pointer.
	self internalPushFloat64: _gsSqueakTemp_value