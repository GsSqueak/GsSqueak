inline primitive generated code
lowcodePrimitiveMoveFloat64ToPhysical
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self internalPopStackFloat64.
	self
		lowcodeCalloutState: lowcodeCalloutState
		float64Register: _gsSqueakTemp_registerID
		value: _gsSqueakTemp_value.
	extA := 0