inline primitive generated code
lowcodePrimitiveDuplicatePointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_dup2 _gsSqueakTemp_dup1 _gsSqueakTemp_pointerValue |
	_gsSqueakTemp_pointerValue := self internalPopStackPointer.
	_gsSqueakTemp_dup1 := _gsSqueakTemp_pointerValue.
	_gsSqueakTemp_dup2 := _gsSqueakTemp_pointerValue.
	self internalPushPointer: _gsSqueakTemp_dup1.
	self internalPushPointer: _gsSqueakTemp_dup2