inline primitive generated code
lowcodePrimitivePushPhysicalPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_pointerValue |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_pointerValue := self lowcodeCalloutState: lowcodeCalloutState pointerRegister: _gsSqueakTemp_registerID.
	self internalPushPointer: _gsSqueakTemp_pointerValue.
	extA := 0