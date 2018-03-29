inline primitive generated code
lowcodePrimitivePushPhysicalInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self lowcodeCalloutState: lowcodeCalloutState int64Register: _gsSqueakTemp_registerID.
	self internalPushInt64: _gsSqueakTemp_value.
	extA := 0