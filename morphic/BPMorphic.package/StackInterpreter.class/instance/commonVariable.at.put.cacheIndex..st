indexing primitive support
commonVariable: rcvr at: index put: value cacheIndex: atIx 
	"This code assumes the receiver has been identified at location atIx in
	the atCache."
	| _gsSqueakTemp_stSize _gsSqueakTemp_fmt _gsSqueakTemp_fixedFields _gsSqueakTemp_valToPut _gsSqueakTemp_isCharacter |
	_gsSqueakTemp_stSize := atCache at: atIx + AtCacheSize.
	((self oop: index isGreaterThanOrEqualTo: 1)
			and: [self oop: index isLessThanOrEqualTo: _gsSqueakTemp_stSize])
		ifTrue: [_gsSqueakTemp_fmt := atCache at: atIx + AtCacheFmt.
			_gsSqueakTemp_fmt <= objectMemory weakArrayFormat
				ifTrue: [self assert: (objectMemory isContextNonImm: rcvr) not.
					_gsSqueakTemp_fixedFields := atCache at: atIx + AtCacheFixedFields.
					^ objectMemory
						storePointer: index + _gsSqueakTemp_fixedFields - 1
						ofObject: rcvr
						withValue: value].
			_gsSqueakTemp_fmt < objectMemory firstByteFormat
				ifTrue: ["64, 32, & 16 bits"
					objectMemory hasSpurMemoryManagerAPI
						ifTrue: [_gsSqueakTemp_fmt >= objectMemory firstShortFormat
								ifTrue: [_gsSqueakTemp_valToPut := (objectMemory isIntegerObject: value)
												ifTrue: [objectMemory integerValueOf: value]
												ifFalse: [-1].
									(_gsSqueakTemp_valToPut >= 0
											and: [_gsSqueakTemp_valToPut <= 65535])
										ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
									^ objectMemory
										storeShort16: index - 1
										ofObject: rcvr
										withValue: _gsSqueakTemp_valToPut].
							_gsSqueakTemp_fmt = objectMemory sixtyFourBitIndexableFormat
								ifTrue: [| val64ToPut |
									val64ToPut := self positive64BitValueOf: value.
									self successful
										ifTrue: [^ objectMemory
												storeLong64: index - 1
												ofObject: rcvr
												withValue: val64ToPut].
									^ self primitiveFailFor: PrimErrBadArgument]].
					_gsSqueakTemp_valToPut := self positive32BitValueOf: value.
					self successful
						ifTrue: [^ objectMemory
								storeLong32: index - 1
								ofObject: rcvr
								withValue: _gsSqueakTemp_valToPut].
					^ self primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_fmt >= objectMemory firstStringyFakeFormat
				ifTrue: ["Note fmt >= firstStringyFormat is an artificial flag for
					strings "
					_gsSqueakTemp_isCharacter := objectMemory isCharacterObject: value.
					_gsSqueakTemp_isCharacter
						ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
					objectMemory hasSpurMemoryManagerAPI
						ifTrue: [_gsSqueakTemp_valToPut := objectMemory characterValueOf: value]
						ifFalse: [_gsSqueakTemp_valToPut := objectMemory fetchPointer: CharacterValueIndex ofObject: value.
							_gsSqueakTemp_valToPut := (objectMemory isIntegerObject: _gsSqueakTemp_valToPut)
										ifTrue: [objectMemory integerValueOf: _gsSqueakTemp_valToPut]
										ifFalse: [-1]].
					objectMemory hasSpurMemoryManagerAPI
						ifTrue: [_gsSqueakTemp_fmt < (objectMemory firstByteFormat + objectMemory firstStringyFakeFormat)
								ifTrue: [_gsSqueakTemp_fmt < (objectMemory firstShortFormat + objectMemory firstStringyFakeFormat)
										ifTrue: [self assert: _gsSqueakTemp_fmt ~= (objectMemory sixtyFourBitIndexableFormat + objectMemory firstStringyFakeFormat).
											^ objectMemory
												storeLong32: index - 1
												ofObject: rcvr
												withValue: _gsSqueakTemp_valToPut]
										ifFalse: [(_gsSqueakTemp_valToPut >= 0
													and: [_gsSqueakTemp_valToPut <= 65535])
												ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
											^ objectMemory
												storeShort16: index - 1
												ofObject: rcvr
												withValue: _gsSqueakTemp_valToPut]]]]
				ifFalse: [(_gsSqueakTemp_fmt >= objectMemory firstCompiledMethodFormat
							and: [index
									< (self firstByteIndexOfMethod: rcvr)])
						ifTrue: [^ self primitiveFailFor: PrimErrBadIndex].
					_gsSqueakTemp_valToPut := (objectMemory isIntegerObject: value)
								ifTrue: [objectMemory integerValueOf: value]
								ifFalse: [-1]].
			(_gsSqueakTemp_valToPut >= 0
					and: [_gsSqueakTemp_valToPut <= 255])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
			^ objectMemory
				storeByte: index - 1
				ofObject: rcvr
				withValue: _gsSqueakTemp_valToPut].
	^ self
		primitiveFailFor: ((objectMemory isIndexable: rcvr)
				ifTrue: [PrimErrBadIndex]
				ifFalse: [PrimErrBadReceiver])