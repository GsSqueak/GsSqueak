inline primitive generated code
lowcodePrimitiveAnd64
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_result _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackInt64.
	_gsSqueakTemp_first := self internalPopStackInt64.
	_gsSqueakTemp_result := _gsSqueakTemp_first bitAnd: _gsSqueakTemp_second.
	self internalPushInt64: _gsSqueakTemp_result