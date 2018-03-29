indexing primitives
primitiveV3StringReplace
	"<array> primReplaceFrom: start to: stop with: replacement
	startingAt: repStart 
	<primitive: 105>"
	| _gsSqueakTemp_array _gsSqueakTemp_start _gsSqueakTemp_stop _gsSqueakTemp_repl _gsSqueakTemp_replStart _gsSqueakTemp_hdr _gsSqueakTemp_arrayFmt _gsSqueakTemp_totalLength _gsSqueakTemp_arrayInstSize _gsSqueakTemp_replFmt _gsSqueakTemp_replInstSize _gsSqueakTemp_srcIndex |
	_gsSqueakTemp_array := self stackValue: 4.
	_gsSqueakTemp_start := self stackIntegerValue: 3.
	_gsSqueakTemp_stop := self stackIntegerValue: 2.
	_gsSqueakTemp_repl := self stackValue: 1.
	_gsSqueakTemp_replStart := self stackIntegerValue: 0.
	self successful
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isImmediate: _gsSqueakTemp_repl)
		ifTrue: ["can happen in LgInt copy"
			^ self primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_stop >= _gsSqueakTemp_start
			and: [objectMemory isObjImmutable: _gsSqueakTemp_array])
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_hdr := objectMemory baseHeader: _gsSqueakTemp_array.
	_gsSqueakTemp_arrayFmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: _gsSqueakTemp_array
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_arrayFmt.
	_gsSqueakTemp_arrayInstSize := objectMemory
				fixedFieldsOf: _gsSqueakTemp_array
				format: _gsSqueakTemp_arrayFmt
				length: _gsSqueakTemp_totalLength.
	(_gsSqueakTemp_start >= 1
			and: [_gsSqueakTemp_start - 1 <= _gsSqueakTemp_stop
					and: [_gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize <= _gsSqueakTemp_totalLength]])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_hdr := objectMemory baseHeader: _gsSqueakTemp_repl.
	_gsSqueakTemp_replFmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: _gsSqueakTemp_repl
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_replFmt.
	_gsSqueakTemp_replInstSize := objectMemory
				fixedFieldsOf: _gsSqueakTemp_repl
				format: _gsSqueakTemp_replFmt
				length: _gsSqueakTemp_totalLength.
	(_gsSqueakTemp_replStart >= 1
			and: [_gsSqueakTemp_stop - _gsSqueakTemp_start + _gsSqueakTemp_replStart + _gsSqueakTemp_replInstSize <= _gsSqueakTemp_totalLength])
		ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
	"Array formats (without byteSize bits, if bytes array) must be the same"
	_gsSqueakTemp_arrayFmt < objectMemory firstByteFormat
		ifTrue: [_gsSqueakTemp_arrayFmt = _gsSqueakTemp_replFmt
				ifFalse: [^ self primitiveFailFor: PrimErrInappropriate]]
		ifFalse: [(_gsSqueakTemp_arrayFmt bitAnd: objectMemory byteFormatMask)
					= (_gsSqueakTemp_replFmt bitAnd: objectMemory byteFormatMask)
				ifFalse: [^ self primitiveFailFor: PrimErrInappropriate]].
	_gsSqueakTemp_srcIndex := _gsSqueakTemp_replStart + _gsSqueakTemp_replInstSize - 1.
	"- 1 for 0-based access"
	_gsSqueakTemp_arrayFmt <= objectMemory lastPointerFormat
		ifTrue: [_gsSqueakTemp_start + _gsSqueakTemp_arrayInstSize - 1
				to: _gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize - 1
				do: [:i | 
					objectMemory
						storePointer: i
						ofObject: _gsSqueakTemp_array
						withValue: (objectMemory fetchPointer: _gsSqueakTemp_srcIndex ofObject: _gsSqueakTemp_repl).
					_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 1]]
		ifFalse: [_gsSqueakTemp_arrayFmt < objectMemory firstByteFormat
				ifTrue: ["32-bit-word type objects"
					_gsSqueakTemp_start + _gsSqueakTemp_arrayInstSize - 1
						to: _gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize - 1
						do: [:i | 
							objectMemory
								storeLong32: i
								ofObject: _gsSqueakTemp_array
								withValue: (objectMemory fetchLong32: _gsSqueakTemp_srcIndex ofObject: _gsSqueakTemp_repl).
							_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 1]]
				ifFalse: ["byte-type objects"
					_gsSqueakTemp_start + _gsSqueakTemp_arrayInstSize - 1
						to: _gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize - 1
						do: [:i | 
							objectMemory
								storeByte: i
								ofObject: _gsSqueakTemp_array
								withValue: (objectMemory fetchByte: _gsSqueakTemp_srcIndex ofObject: _gsSqueakTemp_repl).
							_gsSqueakTemp_srcIndex := _gsSqueakTemp_srcIndex + 1]]].
	"We might consider comparing stop - start to some value here and
	using forceInterruptCheck"
	self pop: argumentCount
	"leave rcvr on stack"