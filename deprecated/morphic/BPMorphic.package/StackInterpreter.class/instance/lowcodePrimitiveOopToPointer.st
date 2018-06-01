inline primitive generated code
lowcodePrimitiveOopToPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_pointer |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_pointer := self
				pointerAtPointer: (objectMemory firstIndexableField: _gsSqueakTemp_object).
	self internalPushPointer: _gsSqueakTemp_pointer