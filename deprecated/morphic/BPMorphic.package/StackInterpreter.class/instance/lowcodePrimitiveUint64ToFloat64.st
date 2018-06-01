inline primitive generated code
lowcodePrimitiveUint64ToFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := self
				cCoerce: (self cCoerce: _gsSqueakTemp_value to: 'uint64_t')
				to: 'double'.
	self internalPushFloat64: _gsSqueakTemp_result