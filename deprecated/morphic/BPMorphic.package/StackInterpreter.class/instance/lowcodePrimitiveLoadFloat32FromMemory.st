inline primitive generated code
lowcodePrimitiveLoadFloat32FromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_value |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_value := self singleFloatAtPointer: _gsSqueakTemp_pointer.
	self internalPushFloat32: _gsSqueakTemp_value