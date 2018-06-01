inline primitive generated code
lowcodePrimitivePushPhysicalInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self lowcodeCalloutState: lowcodeCalloutState int32Register: _gsSqueakTemp_registerID.
	self internalPushInt32: _gsSqueakTemp_value.
	extA := 0