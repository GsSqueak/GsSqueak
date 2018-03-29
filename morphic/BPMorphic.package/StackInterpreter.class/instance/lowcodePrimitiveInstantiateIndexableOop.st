inline primitive generated code
lowcodePrimitiveInstantiateIndexableOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_indexableSize _gsSqueakTemp_object _gsSqueakTemp_classOop |
	_gsSqueakTemp_indexableSize := extA.
	_gsSqueakTemp_classOop := self internalPopStack.
	_gsSqueakTemp_object := objectMemory instantiateClass: _gsSqueakTemp_classOop indexableSize: _gsSqueakTemp_indexableSize.
	self internalPush: _gsSqueakTemp_object.
	extA := 0