inline primitive generated code
lowcodePrimitivePushSessionIdentifier
	"Lowcode instruction generator"
	| _gsSqueakTemp_value |
	_gsSqueakTemp_value := self getThisSessionID.
	self internalPushInt32: _gsSqueakTemp_value