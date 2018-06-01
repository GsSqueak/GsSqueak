common selector sends
bytecodePrimAt
	"BytecodePrimAt will only succeed if the receiver is in the atCache.
	Otherwise it will fail so that the more general primitiveAt will put it in
	the cache after validating that message lookup results in a primitive
	response. Override to insert in the at: cache here. This is necessary
	since once there
	is a compiled at: primitive method (which doesn't use the at: cache)
	the only
	way something can get installed in the atCache is here."
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_result _gsSqueakTemp_atIx |
	_gsSqueakTemp_index := self internalStackTop.
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	((objectMemory isNonImmediate: _gsSqueakTemp_rcvr)
			and: [objectMemory isIntegerObject: _gsSqueakTemp_index])
		ifTrue: [_gsSqueakTemp_atIx := _gsSqueakTemp_rcvr bitAnd: AtCacheMask.
			"Index into atCache = 4N, for N = 0 ... 7"
			(atCache at: _gsSqueakTemp_atIx + AtCacheOop)
					~= _gsSqueakTemp_rcvr
				ifTrue: [lkupClassTag := objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_rcvr.
					messageSelector := self specialSelector: 16.
					(self lookupInMethodCacheSel: messageSelector classTag: lkupClassTag)
						ifFalse: [argumentCount := 1.
							^ self commonSendOrdinary].
					primitiveFunctionPointer == #primitiveAt
						ifTrue: [self
								install: _gsSqueakTemp_rcvr
								inAtCache: atCache
								at: _gsSqueakTemp_atIx
								string: false]
						ifFalse: [primitiveFunctionPointer == #primitiveStringAt
								ifTrue: [self
										install: _gsSqueakTemp_rcvr
										inAtCache: atCache
										at: _gsSqueakTemp_atIx
										string: true]
								ifFalse: [argumentCount := 1.
									^ self commonSendOrdinary]]].
			self successful
				ifTrue: [_gsSqueakTemp_result := self
								commonVariable: _gsSqueakTemp_rcvr
								at: (objectMemory integerValueOf: _gsSqueakTemp_index)
								cacheIndex: _gsSqueakTemp_atIx].
			self successful
				ifTrue: [self fetchNextBytecode.
					^ self internalPop: 2 thenPush: _gsSqueakTemp_result].
			self initPrimCall].
	messageSelector := self specialSelector: 16.
	argumentCount := 1.
	self normalSend