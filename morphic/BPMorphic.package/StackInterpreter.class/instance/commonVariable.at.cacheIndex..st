indexing primitive support
commonVariable: rcvr at: index cacheIndex: atIx 
	"This code assumes the receiver has been identified at location atIx in
	the atCache."
	| _gsSqueakTemp_stSize _gsSqueakTemp_fmt _gsSqueakTemp_fixedFields _gsSqueakTemp_result |
	_gsSqueakTemp_stSize := atCache at: atIx + AtCacheSize.
	((self oop: index isGreaterThanOrEqualTo: 1)
			and: [self oop: index isLessThanOrEqualTo: _gsSqueakTemp_stSize])
		ifTrue: [_gsSqueakTemp_fmt := atCache at: atIx + AtCacheFmt.
			_gsSqueakTemp_fmt <= objectMemory weakArrayFormat
				ifTrue: [self assert: (objectMemory isContextNonImm: rcvr) not.
					_gsSqueakTemp_fixedFields := atCache at: atIx + AtCacheFixedFields.
					^ objectMemory fetchPointer: index + _gsSqueakTemp_fixedFields - 1 ofObject: rcvr].
			_gsSqueakTemp_fmt < objectMemory firstByteFormat
				ifTrue: ["64, 32, & 16 bits"
					objectMemory hasSpurMemoryManagerAPI
						ifTrue: [_gsSqueakTemp_fmt >= objectMemory firstShortFormat
								ifTrue: [^ objectMemory
										integerObjectOf: (objectMemory fetchUnsignedShort16: index - 1 ofObject: rcvr)].
							_gsSqueakTemp_fmt = objectMemory sixtyFourBitIndexableFormat
								ifTrue: [^ self
										positive64BitIntegerFor: (objectMemory fetchLong64: index - 1 ofObject: rcvr)]].
					_gsSqueakTemp_result := objectMemory fetchLong32: index - 1 ofObject: rcvr.
					^ self positive32BitIntegerFor: _gsSqueakTemp_result].
			_gsSqueakTemp_fmt >= objectMemory firstStringyFakeFormat
				ifTrue: ["Note fmt >= firstStringyFormat is an artificial flag for
					strings "
					"String"
					"Spur supports the String at:[put:] primitives on
					WideString and DoubleByteString"
					_gsSqueakTemp_result := (objectMemory hasSpurMemoryManagerAPI
									and: [_gsSqueakTemp_fmt < (objectMemory firstByteFormat + objectMemory firstStringyFakeFormat)])
								ifTrue: [_gsSqueakTemp_fmt < (objectMemory firstShortFormat + objectMemory firstStringyFakeFormat)
										ifTrue: [objectMemory fetchLong32: index - 1 ofObject: rcvr]
										ifFalse: [objectMemory fetchUnsignedShort16: index - 1 ofObject: rcvr]]
								ifFalse: [objectMemory fetchByte: index - 1 ofObject: rcvr].
					^ self characterForAscii: _gsSqueakTemp_result]
				ifFalse: [(_gsSqueakTemp_fmt < objectMemory firstCompiledMethodFormat
							or: ["ByteArray"
								index
									>= (self firstByteIndexOfMethod: rcvr)
								"CompiledMethod"])
						ifTrue: [^ objectMemory
								integerObjectOf: (objectMemory fetchByte: index - 1 ofObject: rcvr)]]].
	^ self
		primitiveFailFor: ((objectMemory isIndexable: rcvr)
				ifTrue: [PrimErrBadIndex]
				ifFalse: [PrimErrBadReceiver])