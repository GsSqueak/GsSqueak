inline primitive generated code
lowcodePrimitiveFirstIndexableFieldPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_pointer |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_pointer := objectMemory firstIndexableField: _gsSqueakTemp_object.
	self internalPushPointer: _gsSqueakTemp_pointer