inline primitive generated code
lowcodePrimitivePushPhysicalFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self lowcodeCalloutState: lowcodeCalloutState float32Register: _gsSqueakTemp_registerID.
	self internalPushFloat32: _gsSqueakTemp_value.
	extA := 0