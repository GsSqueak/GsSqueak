inline primitive generated code
lowcodePrimitiveInt64ToPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_result := self
				cCoerce: (self cCoerce: _gsSqueakTemp_value to: 'intptr_t')
				to: 'char*'.
	self internalPushPointer: _gsSqueakTemp_result