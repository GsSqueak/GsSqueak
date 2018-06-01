inline primitive generated code
lowcodePrimitiveFirstFieldPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_pointer |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_pointer := objectMemory firstFixedField: _gsSqueakTemp_object.
	self internalPushPointer: _gsSqueakTemp_pointer