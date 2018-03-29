inline primitive generated code
lowcodePrimitiveUint32ToFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_value _gsSqueakTemp_result |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_result := self
				cCoerce: (self cCoerce: _gsSqueakTemp_value to: 'unsigned int')
				to: 'float'.
	self internalPushFloat32: _gsSqueakTemp_result