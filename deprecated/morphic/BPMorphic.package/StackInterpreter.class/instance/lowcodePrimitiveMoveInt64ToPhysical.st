inline primitive generated code
lowcodePrimitiveMoveInt64ToPhysical
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self internalPopStackInt64.
	self
		lowcodeCalloutState: lowcodeCalloutState
		int64Register: _gsSqueakTemp_registerID
		value: _gsSqueakTemp_value.
	extA := 0