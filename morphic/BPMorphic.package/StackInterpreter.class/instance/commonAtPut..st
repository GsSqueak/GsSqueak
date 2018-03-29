indexing primitive support
commonAtPut: stringy 
	"This code is called if the receiver responds primitively to at:Put:.
	N.B. this does *not* use the at cache, instead inlining
	stObject:at:put:. Using the at cache here would require that callers
	set messageSelector
	and lkupClass and that is onerous and error-prone, and in any case,
	inlining produces much better performance than using the at cache
	here. "
	| _gsSqueakTemp_value _gsSqueakTemp_index _gsSqueakTemp_rcvr |
	"to get it inlined in primitiveAtPut and primitiveStringAtPut"
	self initPrimCall.
	_gsSqueakTemp_rcvr := self stackValue: 2.
	_gsSqueakTemp_index := self stackValue: 1.
	_gsSqueakTemp_value := self stackTop.
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrInappropriate].
	"No need to test for large positive integers here. No object has 1g
	elements "
	((objectMemory isNonIntegerObject: _gsSqueakTemp_index)
			or: [argumentCount > 2
					and: ["e.g. object:basicAt:put:"
						objectMemory isForwarded: _gsSqueakTemp_rcvr]])
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	stringy
		ifTrue: [self
				stObject: _gsSqueakTemp_rcvr
				at: _gsSqueakTemp_index
				put: (self asciiOfCharacter: _gsSqueakTemp_value)]
		ifFalse: [self
				stObject: _gsSqueakTemp_rcvr
				at: _gsSqueakTemp_index
				put: _gsSqueakTemp_value].
	self successful
		ifTrue: [self pop: argumentCount + 1 thenPush: _gsSqueakTemp_value]