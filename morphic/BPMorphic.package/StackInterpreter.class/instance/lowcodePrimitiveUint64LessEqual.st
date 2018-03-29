inline primitive generated code
lowcodePrimitiveUint64LessEqual
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_value _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStackInt64.
	_gsSqueakTemp_first := self internalPopStackInt64.
	_gsSqueakTemp_value := (self cCoerce: _gsSqueakTemp_first to: 'uint64_t')
					<= (self cCoerce: _gsSqueakTemp_second to: 'uint64_t')
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value