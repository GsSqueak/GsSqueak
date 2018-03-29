inline primitive generated code
lowcodePrimitiveInstantiateIndexable32Oop
	"Lowcode instruction generator"
	| _gsSqueakTemp_indexableSize _gsSqueakTemp_object _gsSqueakTemp_classOop |
	_gsSqueakTemp_indexableSize := self internalPopStackInt32.
	_gsSqueakTemp_classOop := self internalPopStack.
	_gsSqueakTemp_object := objectMemory instantiateClass: _gsSqueakTemp_classOop indexableSize: _gsSqueakTemp_indexableSize.
	self internalPush: _gsSqueakTemp_object