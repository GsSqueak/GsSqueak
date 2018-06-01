inline primitive generated code
lowcodePrimitiveDuplicateFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_dup1 _gsSqueakTemp_dup2 |
	_gsSqueakTemp_value := self internalPopStackFloat64.
	_gsSqueakTemp_dup1 := _gsSqueakTemp_value.
	_gsSqueakTemp_dup2 := _gsSqueakTemp_value.
	self internalPushFloat64: _gsSqueakTemp_dup1.
	self internalPushFloat64: _gsSqueakTemp_dup2