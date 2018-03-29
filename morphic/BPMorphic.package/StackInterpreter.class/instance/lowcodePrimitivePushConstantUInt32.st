inline primitive generated code
lowcodePrimitivePushConstantUInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result _gsSqueakTemp_constant |
	_gsSqueakTemp_constant := extA.
	_gsSqueakTemp_result := _gsSqueakTemp_constant.
	self internalPushInt32: _gsSqueakTemp_result.
	extA := 0