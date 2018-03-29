compiled methods
primitiveNewMethod
	| _gsSqueakTemp_header _gsSqueakTemp_bytecodeCount _gsSqueakTemp_class _gsSqueakTemp_size _gsSqueakTemp_theMethod _gsSqueakTemp_literalCount |
	_gsSqueakTemp_header := self stackTop.
	_gsSqueakTemp_bytecodeCount := self stackValue: 1.
	((objectMemory isIntegerObject: _gsSqueakTemp_header)
			and: [(objectMemory isIntegerObject: _gsSqueakTemp_bytecodeCount)
					and: [(_gsSqueakTemp_bytecodeCount := objectMemory integerValueOf: _gsSqueakTemp_bytecodeCount) >= 0]])
		ifFalse: [self primitiveFailFor: PrimErrBadArgument.
			^ self].
	_gsSqueakTemp_class := self stackValue: 2.
	_gsSqueakTemp_literalCount := objectMemory literalCountOfMethodHeader: _gsSqueakTemp_header.
	_gsSqueakTemp_size := _gsSqueakTemp_literalCount + LiteralStart * objectMemory bytesPerOop + _gsSqueakTemp_bytecodeCount.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_theMethod := objectMemory instantiateCompiledMethodClass: _gsSqueakTemp_class indexableSize: _gsSqueakTemp_size.
			_gsSqueakTemp_theMethod
				ifNil: [self
						primitiveFailFor: ((objectMemory
									isCompiledMethodFormat: (objectMemory instSpecOfClass: _gsSqueakTemp_class))
								ifTrue: [PrimErrNoMemory]
								ifFalse: [PrimErrBadReceiver]).
					^ self]]
		ifFalse: [_gsSqueakTemp_theMethod := objectMemory instantiateClass: _gsSqueakTemp_class indexableSize: _gsSqueakTemp_size].
	objectMemory
		storePointerUnchecked: HeaderIndex
		ofObject: _gsSqueakTemp_theMethod
		withValue: _gsSqueakTemp_header.
	1
		to: _gsSqueakTemp_literalCount
		do: [:i | objectMemory
				storePointer: i
				ofObject: _gsSqueakTemp_theMethod
				withValue: objectMemory nilObject].
	self pop: 3 thenPush: _gsSqueakTemp_theMethod