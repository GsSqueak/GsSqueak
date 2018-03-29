common selector sends
bytecodePrimAtPut
	"BytecodePrimAtPut will only succeed if the receiver is in the atCache.
	Otherwise it will fail so that the more general primitiveAtPut will put it
	in the
	cache after validating that message lookup results in a primitive
	response. Override to insert in the atCache here. This is necessary
	since once there
	is a compiled at:[put:] primitive method (which doesn't use the at:
	cache) the
	only way something can get installed in the atCache is here."
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_atIx _gsSqueakTemp_value _gsSqueakTemp_correctRcvr |
	_gsSqueakTemp_value := self internalStackTop.
	_gsSqueakTemp_index := self internalStackValue: 1.
	_gsSqueakTemp_rcvr := self internalStackValue: 2.
	self
		cppIf: IMMUTABILITY
		ifTrue: [_gsSqueakTemp_correctRcvr := objectMemory isOopMutable: _gsSqueakTemp_rcvr]
		ifFalse: [_gsSqueakTemp_correctRcvr := objectMemory isNonImmediate: _gsSqueakTemp_rcvr].
	(_gsSqueakTemp_correctRcvr
			and: [objectMemory isIntegerObject: _gsSqueakTemp_index])
		ifTrue: [_gsSqueakTemp_atIx := (_gsSqueakTemp_rcvr bitAnd: AtCacheMask)
						+ AtPutBase.
			"Index into atPutCache"
			(atCache at: _gsSqueakTemp_atIx + AtCacheOop)
					~= _gsSqueakTemp_rcvr
				ifTrue: [lkupClassTag := objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_rcvr.
					messageSelector := self specialSelector: 17.
					(self lookupInMethodCacheSel: messageSelector classTag: lkupClassTag)
						ifFalse: [argumentCount := 2.
							^ self commonSendOrdinary].
					primitiveFunctionPointer == #primitiveAtPut
						ifTrue: [self
								install: _gsSqueakTemp_rcvr
								inAtCache: atCache
								at: _gsSqueakTemp_atIx
								string: false]
						ifFalse: [primitiveFunctionPointer == #primitiveStringAtPut
								ifTrue: [self
										install: _gsSqueakTemp_rcvr
										inAtCache: atCache
										at: _gsSqueakTemp_atIx
										string: true]
								ifFalse: [argumentCount := 2.
									^ self commonSendOrdinary]]].
			self successful
				ifTrue: [self
						commonVariable: _gsSqueakTemp_rcvr
						at: (objectMemory integerValueOf: _gsSqueakTemp_index)
						put: _gsSqueakTemp_value
						cacheIndex: _gsSqueakTemp_atIx].
			self successful
				ifTrue: [self fetchNextBytecode.
					^ self internalPop: 3 thenPush: _gsSqueakTemp_value].
			self initPrimCall].
	messageSelector := self specialSelector: 17.
	argumentCount := 2.
	self normalSend