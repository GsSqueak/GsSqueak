primitives-other
primitiveInitializeBuffer
	| _gsSqueakTemp_wbOop _gsSqueakTemp_size |
	interpreterProxy methodArgumentCount = 1
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_wbOop := interpreterProxy stackObjectValue: 0.
	interpreterProxy failed
		ifTrue: [^ nil].
	(interpreterProxy isWords: _gsSqueakTemp_wbOop)
		ifFalse: [^ interpreterProxy primitiveFail].
	(_gsSqueakTemp_size := interpreterProxy slotSizeOf: _gsSqueakTemp_wbOop) < GWMinimalSize
		ifTrue: [^ interpreterProxy primitiveFail].
	self workBufferPut: _gsSqueakTemp_wbOop.
	objBuffer := workBuffer + GWHeaderSize.
	self magicNumberPut: GWMagicNumber.
	self wbSizePut: _gsSqueakTemp_size.
	self wbTopPut: _gsSqueakTemp_size.
	self statePut: GEStateUnlocked.
	self objStartPut: GWHeaderSize.
	self objUsedPut: 4.
	"Dummy fill object"
	self objectTypeOf: 0 put: GEPrimitiveFill.
	self objectLengthOf: 0 put: 4.
	self objectIndexOf: 0 put: 0.
	self getStartPut: 0.
	self getUsedPut: 0.
	self aetStartPut: 0.
	self aetUsedPut: 0.
	self stopReasonPut: 0.
	self needsFlushPut: 0.
	self clipMinXPut: 0.
	self clipMaxXPut: 0.
	self clipMinYPut: 0.
	self clipMaxYPut: 0.
	self currentZPut: 0.
	self resetGraphicsEngineStats.
	self initEdgeTransform.
	self initColorTransform.
	interpreterProxy pop: 2.
	interpreterProxy push: _gsSqueakTemp_wbOop