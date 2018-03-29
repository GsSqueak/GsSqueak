inline primitive generated code
lowcodePrimitiveInstantiateOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_classOop |
	_gsSqueakTemp_classOop := self internalPopStack.
	_gsSqueakTemp_object := objectMemory instantiateClass: _gsSqueakTemp_classOop indexableSize: 0.
	self internalPush: _gsSqueakTemp_object