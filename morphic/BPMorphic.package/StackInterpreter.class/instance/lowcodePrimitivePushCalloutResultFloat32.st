inline primitive generated code
lowcodePrimitivePushCalloutResultFloat32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self lowcodeCalloutStateFetchResultFloat32: lowcodeCalloutState.
	self internalPushFloat32: _gsSqueakTemp_result