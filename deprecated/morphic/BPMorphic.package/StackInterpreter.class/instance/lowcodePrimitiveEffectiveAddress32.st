inline primitive generated code
lowcodePrimitiveEffectiveAddress32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result _gsSqueakTemp_offset _gsSqueakTemp_base _gsSqueakTemp_scale _gsSqueakTemp_index |
	_gsSqueakTemp_offset := self internalPopStackInt32.
	_gsSqueakTemp_scale := self internalPopStackInt32.
	_gsSqueakTemp_index := self internalPopStackInt32.
	_gsSqueakTemp_base := self internalPopStackPointer.
	_gsSqueakTemp_result := _gsSqueakTemp_base + (_gsSqueakTemp_index * _gsSqueakTemp_scale) + _gsSqueakTemp_offset.
	self internalPushPointer: _gsSqueakTemp_result