indexing primitive support
stObject: array at: index 
	"Return what ST would return for <obj> at: index."
	| _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_totalLength _gsSqueakTemp_fixedFields _gsSqueakTemp_stSize |
	_gsSqueakTemp_hdr := objectMemory baseHeader: array.
	_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: array
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fixedFields := objectMemory
				fixedFieldsOf: array
				format: _gsSqueakTemp_fmt
				length: _gsSqueakTemp_totalLength.
	(_gsSqueakTemp_fmt = objectMemory indexablePointersFormat
			and: [objectMemory isContextHeader: _gsSqueakTemp_hdr])
		ifTrue: [_gsSqueakTemp_stSize := self stackPointerForMaybeMarriedContext: array.
			((self oop: index isGreaterThanOrEqualTo: 1)
					and: [(self oop: index isLessThanOrEqualTo: _gsSqueakTemp_stSize)
							and: [self isStillMarriedContext: array]])
				ifTrue: [^ self
						noInlineTemporary: index - 1
						in: (self frameOfMarriedContext: array)]]
		ifFalse: [_gsSqueakTemp_stSize := _gsSqueakTemp_totalLength - _gsSqueakTemp_fixedFields].
	((self
				oop: index
				isGreaterThanOrEqualTo: (objectMemory firstValidIndexOfIndexableObject: array withFormat: _gsSqueakTemp_fmt))
			and: [self oop: index isLessThanOrEqualTo: _gsSqueakTemp_stSize])
		ifTrue: [^ self
				subscript: array
				with: index + _gsSqueakTemp_fixedFields
				format: _gsSqueakTemp_fmt].
	self
		primitiveFailFor: (_gsSqueakTemp_fmt <= 1
				ifTrue: [PrimErrBadReceiver]
				ifFalse: [PrimErrBadIndex]).
	^ 0