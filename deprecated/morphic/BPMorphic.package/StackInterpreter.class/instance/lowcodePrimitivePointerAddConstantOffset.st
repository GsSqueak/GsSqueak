inline primitive generated code
lowcodePrimitivePointerAddConstantOffset
	"Lowcode instruction generator"
	| _gsSqueakTemp_base _gsSqueakTemp_offset _gsSqueakTemp_result |
	_gsSqueakTemp_offset := extB.
	_gsSqueakTemp_base := self internalPopStackPointer.
	_gsSqueakTemp_result := _gsSqueakTemp_base + _gsSqueakTemp_offset.
	self internalPushPointer: _gsSqueakTemp_result.
	extB := 0.
	numExtB := 0