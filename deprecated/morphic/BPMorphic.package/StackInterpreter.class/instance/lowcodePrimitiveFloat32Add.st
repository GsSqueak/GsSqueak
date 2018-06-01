inline primitive generated code
lowcodePrimitiveFloat32Add
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_result _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackFloat32.
	_gsSqueakTemp_first := self internalPopStackFloat32.
	_gsSqueakTemp_result := _gsSqueakTemp_first + _gsSqueakTemp_second.
	self internalPushFloat32: _gsSqueakTemp_result