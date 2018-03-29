inline primitive generated code
lowcodePrimitiveFloat64ToInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_floatValue _gsSqueakTemp_int32Result |
	_gsSqueakTemp_floatValue := self internalPopStackFloat64.
	_gsSqueakTemp_int32Result := self cCoerce: _gsSqueakTemp_floatValue to: 'sqInt'.
	self internalPushInt32: _gsSqueakTemp_int32Result