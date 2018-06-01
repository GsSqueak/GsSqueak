indexing primitives
primitiveSize
	| _gsSqueakTemp_rcvr _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_fixedFields _gsSqueakTemp_totalLength |
	_gsSqueakTemp_rcvr := self stackTop.
	((objectMemory isImmediate: _gsSqueakTemp_rcvr)
			or: ["Integers are not indexable"
				_gsSqueakTemp_hdr := objectMemory baseHeader: _gsSqueakTemp_rcvr.
				(_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr) < 2])
		ifTrue: ["This is not an indexable object"
			^ self primitiveFailFor: PrimErrBadReceiver].
	(_gsSqueakTemp_fmt = objectMemory indexablePointersFormat
			and: [objectMemory isContextHeader: _gsSqueakTemp_hdr])
		ifTrue: [^ self primitiveContextSize].
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: _gsSqueakTemp_rcvr
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fixedFields := objectMemory
				fixedFieldsOf: _gsSqueakTemp_rcvr
				format: _gsSqueakTemp_fmt
				length: _gsSqueakTemp_totalLength.
	self
		pop: argumentCount + 1
		thenPush: (objectMemory integerObjectOf: _gsSqueakTemp_totalLength - _gsSqueakTemp_fixedFields)