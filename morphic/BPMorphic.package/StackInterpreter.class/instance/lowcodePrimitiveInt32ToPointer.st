inline primitive generated code
lowcodePrimitiveInt32ToPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := self
				cCoerce: (self cCoerce: _gsSqueakTemp_value to: 'uintptr_t')
				to: 'char*'.
	self internalPushPointer: _gsSqueakTemp_result