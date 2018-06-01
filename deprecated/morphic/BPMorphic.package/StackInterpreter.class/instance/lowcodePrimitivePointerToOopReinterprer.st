inline primitive generated code
lowcodePrimitivePointerToOopReinterprer
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_object |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_object := self cCoerce: _gsSqueakTemp_pointer to: 'sqInt'.
	self internalPush: _gsSqueakTemp_object