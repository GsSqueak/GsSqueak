inline primitive generated code
lowcodePrimitiveUrem64
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_result _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackInt64.
	_gsSqueakTemp_first := self internalPopStackInt64.
	_gsSqueakTemp_result := (self cCoerce: _gsSqueakTemp_first to: 'unsigned int')
				\\ (self cCoerce: _gsSqueakTemp_second to: 'unsigned int').
	self internalPushInt64: _gsSqueakTemp_result