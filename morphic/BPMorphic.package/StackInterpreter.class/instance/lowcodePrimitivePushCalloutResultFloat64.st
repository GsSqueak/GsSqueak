inline primitive generated code
lowcodePrimitivePushCalloutResultFloat64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self lowcodeCalloutStateFetchResultFloat64: lowcodeCalloutState.
	self internalPushFloat64: _gsSqueakTemp_result