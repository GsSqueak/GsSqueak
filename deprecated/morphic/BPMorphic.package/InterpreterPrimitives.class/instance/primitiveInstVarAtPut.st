object access primitives
primitiveInstVarAtPut
	| _gsSqueakTemp_newValue _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_totalLength _gsSqueakTemp_fixedFields |
	_gsSqueakTemp_newValue := self stackTop.
	_gsSqueakTemp_index := self stackValue: 1.
	_gsSqueakTemp_rcvr := self stackValue: 2.
	((objectMemory isNonIntegerObject: _gsSqueakTemp_index)
			or: [argumentCount > 2
					and: ["e.g. object:instVarAt:put:"
						objectMemory isOopForwarded: _gsSqueakTemp_rcvr]])
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	_gsSqueakTemp_hdr := objectMemory baseHeader: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: _gsSqueakTemp_rcvr
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fixedFields := objectMemory
				fixedFieldsOf: _gsSqueakTemp_rcvr
				format: _gsSqueakTemp_fmt
				length: _gsSqueakTemp_totalLength.
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index <= _gsSqueakTemp_fixedFields])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	self
		subscript: _gsSqueakTemp_rcvr
		with: _gsSqueakTemp_index
		storing: _gsSqueakTemp_newValue
		format: _gsSqueakTemp_fmt.
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue