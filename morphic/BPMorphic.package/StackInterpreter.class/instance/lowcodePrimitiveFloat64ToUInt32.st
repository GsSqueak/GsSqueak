inline primitive generated code
lowcodePrimitiveFloat64ToUInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_int64Result |
	_gsSqueakTemp_floatValue := self internalPopStackFloat64.
	_gsSqueakTemp_int64Result := self cCoerce: _gsSqueakTemp_floatValue to: 'uint32_t'.
	self internalPushInt32: _gsSqueakTemp_int64Result