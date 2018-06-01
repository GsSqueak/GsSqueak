inline primitive generated code
lowcodePrimitivePushCalloutResultPointer
	"Lowcode instruction generator"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := self lowcodeCalloutStateFetchResultPointer: lowcodeCalloutState.
	self internalPushPointer: _gsSqueakTemp_result