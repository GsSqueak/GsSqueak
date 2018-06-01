inline primitive generated code
lowcodePrimitiveOopToPointerReinterpret
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_pointer |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_pointer := self cCoerce: _gsSqueakTemp_object to: 'char*'.
	self internalPushPointer: _gsSqueakTemp_pointer