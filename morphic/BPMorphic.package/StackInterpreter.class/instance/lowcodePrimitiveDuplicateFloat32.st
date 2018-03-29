inline primitive generated code
lowcodePrimitiveDuplicateFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_dup1 _gsSqueakTemp_dup2 |
	_gsSqueakTemp_value := self internalPopStackFloat32.
	_gsSqueakTemp_dup1 := _gsSqueakTemp_value.
	_gsSqueakTemp_dup2 := _gsSqueakTemp_value.
	self internalPushFloat32: _gsSqueakTemp_dup1.
	self internalPushFloat32: _gsSqueakTemp_dup2