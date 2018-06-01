object access primitives
primitiveInstVarAt
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_totalLength _gsSqueakTemp_fixedFields _gsSqueakTemp_value |
	_gsSqueakTemp_index := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	((objectMemory isNonIntegerObject: _gsSqueakTemp_index)
			or: [argumentCount > 1
					and: ["e.g. object:instVarAt:"
						objectMemory isOopForwarded: _gsSqueakTemp_rcvr]])
		ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_index := objectMemory integerValueOf: _gsSqueakTemp_index.
	_gsSqueakTemp_hdr := self baseHeader: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := self
				lengthOf: _gsSqueakTemp_rcvr
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fixedFields := self
				fixedFieldsOf: _gsSqueakTemp_rcvr
				format: _gsSqueakTemp_fmt
				length: _gsSqueakTemp_totalLength.
	(_gsSqueakTemp_index >= 1
			and: [_gsSqueakTemp_index <= _gsSqueakTemp_fixedFields])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_value := self
				subscript: _gsSqueakTemp_rcvr
				with: _gsSqueakTemp_index
				format: _gsSqueakTemp_fmt.
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_value