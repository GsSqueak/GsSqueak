inline primitive generated code
lowcodePrimitivePushConstantUInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result _gsSqueakTemp_constant |
	_gsSqueakTemp_constant := extA.
	_gsSqueakTemp_result := _gsSqueakTemp_constant.
	self internalPushInt64: _gsSqueakTemp_result.
	extA := 0