inline primitive generated code
lowcodePrimitivePushCalloutResultInt32
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self lowcodeCalloutStateFetchResultInt32: lowcodeCalloutState.
	self internalPushInt32: _gsSqueakTemp_result