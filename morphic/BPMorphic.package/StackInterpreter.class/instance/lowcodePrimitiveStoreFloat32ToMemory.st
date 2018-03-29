inline primitive generated code
lowcodePrimitiveStoreFloat32ToMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_pointer |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_floatValue := self internalPopStackFloat32.
	self singleFloatAtPointer: _gsSqueakTemp_pointer put: _gsSqueakTemp_floatValue