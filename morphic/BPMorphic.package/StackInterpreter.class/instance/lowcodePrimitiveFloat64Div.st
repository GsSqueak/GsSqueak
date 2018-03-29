inline primitive generated code
lowcodePrimitiveFloat64Div
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_result _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackFloat64.
	_gsSqueakTemp_first := self internalPopStackFloat64.
	_gsSqueakTemp_result := _gsSqueakTemp_first / _gsSqueakTemp_second.
	self internalPushFloat64: _gsSqueakTemp_result