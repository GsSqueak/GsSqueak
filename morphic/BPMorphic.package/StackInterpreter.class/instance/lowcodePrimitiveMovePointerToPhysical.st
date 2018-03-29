inline primitive generated code
lowcodePrimitiveMovePointerToPhysical
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_pointerValue |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_pointerValue := self internalPopStackPointer.
	self
		lowcodeCalloutState: lowcodeCalloutState
		pointerRegister: _gsSqueakTemp_registerID
		value: _gsSqueakTemp_pointerValue.
	extA := 0