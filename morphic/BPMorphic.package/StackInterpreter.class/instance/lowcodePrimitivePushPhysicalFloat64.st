inline primitive generated code
lowcodePrimitivePushPhysicalFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self lowcodeCalloutState: lowcodeCalloutState float64Register: _gsSqueakTemp_registerID.
	self internalPushFloat64: _gsSqueakTemp_value.
	extA := 0