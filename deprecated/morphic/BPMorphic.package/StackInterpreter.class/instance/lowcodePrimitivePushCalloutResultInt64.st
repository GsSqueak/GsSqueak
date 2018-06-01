inline primitive generated code
lowcodePrimitivePushCalloutResultInt64
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self lowcodeCalloutStateFetchResultInt64: lowcodeCalloutState.
	self internalPushInt64: _gsSqueakTemp_result