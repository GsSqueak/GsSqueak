inline primitive generated code
lowcodePrimitiveFloat32ToInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackFloat32.
	_gsSqueakTemp_result := self cCoerce: _gsSqueakTemp_value to: 'sqLong'.
	self internalPushInt64: _gsSqueakTemp_result