indexing primitive support
commonAt: stringy 
	"This code is called if the receiver responds primitively to at:.
	N.B. this does *not* use the at cache, instead inlining stObject:at:.
	Using the at cache here would require that callers set
	messageSelector and lkupClass and that is onerous and error-prone,
	and in any case,
	inlining produces much better performance than using the at cache
	here. "
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_result |
	"to get it inlined in primitiveAt and primitiveStringAt"
	self initPrimCall.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	_gsSqueakTemp_index := self stackTop.
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrInappropriate].
	"No need to test for large positive integers here. No object has 1g
	elements "
	((objectMemory isNonIntegerObject: _gsSqueakTemp_index)
			or: [argumentCount > 1
					and: ["e.g. object:basicAt:"
						objectMemory isForwarded: _gsSqueakTemp_rcvr]])
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	_gsSqueakTemp_result := self stObject: _gsSqueakTemp_rcvr at: _gsSqueakTemp_index.
	self successful
		ifTrue: [stringy
				ifTrue: [(objectMemory isInRangeCharacterCode: _gsSqueakTemp_result)
						ifFalse: [^ self primitiveFailFor: PrimErrBadReceiver].
					_gsSqueakTemp_result := self
								characterForAscii: (objectMemory integerValueOf: _gsSqueakTemp_result)].
			self pop: argumentCount + 1 thenPush: _gsSqueakTemp_result]