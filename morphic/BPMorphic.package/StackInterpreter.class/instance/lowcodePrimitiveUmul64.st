inline primitive generated code
lowcodePrimitiveUmul64
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_result _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackInt64.
	_gsSqueakTemp_first := self internalPopStackInt64.
	_gsSqueakTemp_result := (self cCoerce: _gsSqueakTemp_first to: 'uint64_t')
				* (self cCoerce: _gsSqueakTemp_second to: 'uint64_t').
	self internalPushInt64: _gsSqueakTemp_result