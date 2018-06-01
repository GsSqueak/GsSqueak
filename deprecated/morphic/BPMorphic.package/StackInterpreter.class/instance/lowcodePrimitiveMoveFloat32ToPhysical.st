inline primitive generated code
lowcodePrimitiveMoveFloat32ToPhysical
	"Lowcode instruction generator"
	| _gsSqueakTemp_registerID _gsSqueakTemp_value |
	_gsSqueakTemp_registerID := extA.
	_gsSqueakTemp_value := self internalPopStackFloat32.
	self
		lowcodeCalloutState: lowcodeCalloutState
		float32Register: _gsSqueakTemp_registerID
		value: _gsSqueakTemp_value.
	extA := 0