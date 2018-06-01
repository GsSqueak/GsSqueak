inline primitive generated code
lowcodePrimitivePointerToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_object _gsSqueakTemp_pointerClassLiteral |
	_gsSqueakTemp_pointerClassLiteral := self literal: extA.
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_object := objectMemory instantiateClass: _gsSqueakTemp_pointerClassLiteral indexableSize: BytesPerWord.
	self
		pointerAtPointer: (objectMemory firstIndexableField: _gsSqueakTemp_object)
		put: _gsSqueakTemp_pointer.
	self internalPush: _gsSqueakTemp_object.
	extA := 0