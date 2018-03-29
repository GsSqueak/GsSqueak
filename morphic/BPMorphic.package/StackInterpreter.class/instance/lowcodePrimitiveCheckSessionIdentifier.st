inline primitive generated code
lowcodePrimitiveCheckSessionIdentifier
	"Lowcode instruction generator"
	| _gsSqueakTemp_expectedSession _gsSqueakTemp_value |
	_gsSqueakTemp_expectedSession := extA.
	_gsSqueakTemp_value := _gsSqueakTemp_expectedSession = self getThisSessionID
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value.
	extA := 0