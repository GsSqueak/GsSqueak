inline primitive generated code
lowcodePrimitiveAlloca64
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer _gsSqueakTemp_size |
	_gsSqueakTemp_size := self internalPopStackInt64.
	nativeStackPointer := nativeStackPointer - _gsSqueakTemp_size.
	_gsSqueakTemp_pointer := nativeStackPointer.
	self internalPushPointer: _gsSqueakTemp_pointer