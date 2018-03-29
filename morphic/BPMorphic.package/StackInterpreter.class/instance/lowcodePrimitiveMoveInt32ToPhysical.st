inline primitive generated code
lowcodePrimitiveMoveInt32ToPhysical
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self internalPopStackInt32.
	self
		lowcodeCalloutState: lowcodeCalloutState
		int32Register: _gsSqueakTemp_registerID
		value: _gsSqueakTemp_value.
	extA := 0