common selector sends
bytecodePrimSize
	| _gsSqueakTemp_rcvr _gsSqueakTemp_sz _gsSqueakTemp_isString _gsSqueakTemp_isArray |
	self initPrimCall.
	_gsSqueakTemp_rcvr := self internalStackTop.
	"Shortcut the mega-lookup for ByteString and Array, the two big
	consumers of cycles
	here. Both of these have compact class indices and neither has any
	added fields."
	_gsSqueakTemp_isString := self isInstanceOfClassByteString: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_isString
		ifTrue: [_gsSqueakTemp_sz := objectMemory lengthOf: _gsSqueakTemp_rcvr.
			self
				internalStackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_sz).
			^ self fetchNextBytecode].
	_gsSqueakTemp_isArray := self isInstanceOfClassArray: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_isArray
		ifTrue: [_gsSqueakTemp_sz := objectMemory lengthOf: _gsSqueakTemp_rcvr.
			self
				internalStackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_sz).
			^ self fetchNextBytecode].
	messageSelector := self specialSelector: 18.
	argumentCount := 0.
	self normalSend