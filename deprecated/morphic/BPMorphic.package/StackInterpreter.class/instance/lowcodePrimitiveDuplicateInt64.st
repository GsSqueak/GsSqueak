inline primitive generated code
lowcodePrimitiveDuplicateInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_dup1 _gsSqueakTemp_dup2 |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_dup1 := _gsSqueakTemp_value.
	_gsSqueakTemp_dup2 := _gsSqueakTemp_value.
	self internalPushInt64: _gsSqueakTemp_dup1.
	self internalPushInt64: _gsSqueakTemp_dup2