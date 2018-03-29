inline primitive generated code
lowcodePrimitiveDuplicateInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_dup1 _gsSqueakTemp_dup2 |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_dup1 := _gsSqueakTemp_value.
	_gsSqueakTemp_dup2 := _gsSqueakTemp_value.
	self internalPushInt32: _gsSqueakTemp_dup1.
	self internalPushInt32: _gsSqueakTemp_dup2