inline primitive generated code
lowcodePrimitivePointerAddOffset64
	"Lowcode instruction generator"
	| _gsSqueakTemp_base _gsSqueakTemp_offset _gsSqueakTemp_result |
	_gsSqueakTemp_offset := self internalPopStackInt64.
	_gsSqueakTemp_base := self internalPopStackPointer.
	_gsSqueakTemp_result := _gsSqueakTemp_base + _gsSqueakTemp_offset.
	self internalPushPointer: _gsSqueakTemp_result