object access primitives
primitiveNewWithArg
	"Allocate a new indexable instance. Fail if the allocation would leave
	less than lowSpaceThreshold bytes free. May cause a GC."
	| _gsSqueakTemp_size _gsSqueakTemp_spaceOkay _gsSqueakTemp_instSpec |
	NewspeakVM
		ifTrue: ["For the mirror prims check that the class obj is actually a valid
			class. "
			(argumentCount < 2
					or: [self
							addressCouldBeClassObj: (self stackValue: 1)])
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument]].
	_gsSqueakTemp_size := self positiveMachineIntegerValueOf: self stackTop.
	self successful
		ifFalse: ["positiveMachineIntegerValueOf: succeeds only for
			non-negative integers."
			^ self primitiveFailFor: PrimErrBadArgument].
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [(objectMemory
				instantiateClass: (self stackValue: 1)
				indexableSize: _gsSqueakTemp_size)
				ifNil: [_gsSqueakTemp_instSpec := objectMemory
								instSpecOfClass: (self stackValue: 1).
					self
						primitiveFailFor: (((objectMemory isIndexableFormat: _gsSqueakTemp_instSpec)
									and: [(objectMemory isCompiledMethodFormat: _gsSqueakTemp_instSpec) not])
								ifTrue: [PrimErrNoMemory]
								ifFalse: [PrimErrBadReceiver])]
				ifNotNil: [:obj | self pop: argumentCount + 1 thenPush: obj]]
		ifFalse: [_gsSqueakTemp_spaceOkay := objectMemory
						sufficientSpaceToInstantiate: (self stackValue: 1)
						indexableSize: _gsSqueakTemp_size.
			_gsSqueakTemp_spaceOkay
				ifTrue: [self
						pop: argumentCount + 1
						thenPush: (objectMemory
								instantiateClass: (self stackValue: 1)
								indexableSize: _gsSqueakTemp_size)]
				ifFalse: [self primitiveFailFor: PrimErrNoMemory]]