indexing primitives
primitiveSpurStringReplace
	"<array> primReplaceFrom: start to: stop with: replacement
	startingAt: repStart 
	<primitive: 105>"
	| _gsSqueakTemp_array _gsSqueakTemp_start _gsSqueakTemp_stop _gsSqueakTemp_repl _gsSqueakTemp_replStart _gsSqueakTemp_arrayFmt _gsSqueakTemp_arrayLength _gsSqueakTemp_arrayInstSize _gsSqueakTemp_replFmt _gsSqueakTemp_replLength _gsSqueakTemp_replInstSize _gsSqueakTemp_srcDelta |
	_gsSqueakTemp_array := self stackValue: 4.
	_gsSqueakTemp_start := self stackValue: 3.
	_gsSqueakTemp_stop := self stackValue: 2.
	_gsSqueakTemp_repl := self stackValue: 1.
	_gsSqueakTemp_replStart := self stackValue: 0.
	((objectMemory isNonIntegerObject: _gsSqueakTemp_start)
			or: [(objectMemory isNonIntegerObject: _gsSqueakTemp_stop)
					or: [(objectMemory isNonIntegerObject: _gsSqueakTemp_replStart)
							or: [objectMemory isImmediate: _gsSqueakTemp_repl]]])
		ifTrue: ["can happen in LgInt copy"
			^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_start := objectMemory integerValueOf: _gsSqueakTemp_start.
	_gsSqueakTemp_stop := objectMemory integerValueOf: _gsSqueakTemp_stop.
	_gsSqueakTemp_replStart := objectMemory integerValueOf: _gsSqueakTemp_replStart.
	(_gsSqueakTemp_stop >= _gsSqueakTemp_start
			and: [objectMemory isObjImmutable: _gsSqueakTemp_array])
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_arrayFmt := objectMemory formatOf: _gsSqueakTemp_array.
	_gsSqueakTemp_arrayLength := objectMemory lengthOf: _gsSqueakTemp_array format: _gsSqueakTemp_arrayFmt.
	_gsSqueakTemp_arrayFmt := objectMemory classFormatFromInstFormat: _gsSqueakTemp_arrayFmt.
	_gsSqueakTemp_replFmt := objectMemory formatOf: _gsSqueakTemp_repl.
	_gsSqueakTemp_replLength := objectMemory lengthOf: _gsSqueakTemp_repl format: _gsSqueakTemp_replFmt.
	_gsSqueakTemp_replFmt := objectMemory classFormatFromInstFormat: _gsSqueakTemp_replFmt.
	"Array formats (without oddFields bits) must be the same"
	(_gsSqueakTemp_arrayFmt = _gsSqueakTemp_replFmt
			and: [_gsSqueakTemp_arrayFmt < objectMemory firstCompiledMethodFormat])
		ifFalse: [^ self primitiveFailFor: PrimErrInappropriate].
	"N.B. In the below start - 1 to: stop - 1 do:, Slang is intelligent enough
	to use < instead of <= so avoiding the stop - 1."
	_gsSqueakTemp_arrayFmt <= objectMemory lastPointerFormat
		ifTrue: [_gsSqueakTemp_arrayInstSize := objectMemory
						fixedFieldsOf: _gsSqueakTemp_array
						format: _gsSqueakTemp_arrayFmt
						length: _gsSqueakTemp_arrayLength.
			_gsSqueakTemp_replInstSize := objectMemory
						fixedFieldsOf: _gsSqueakTemp_repl
						format: _gsSqueakTemp_replFmt
						length: _gsSqueakTemp_replLength.
			(_gsSqueakTemp_start >= 1
					and: [_gsSqueakTemp_start - 1 <= _gsSqueakTemp_stop
							and: [_gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize <= _gsSqueakTemp_arrayLength
									and: [_gsSqueakTemp_replStart >= 1
											and: [_gsSqueakTemp_stop - _gsSqueakTemp_start + _gsSqueakTemp_replStart + _gsSqueakTemp_replInstSize <= _gsSqueakTemp_replLength]]]])
				ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
			_gsSqueakTemp_start := _gsSqueakTemp_start + _gsSqueakTemp_arrayInstSize.
			_gsSqueakTemp_stop := _gsSqueakTemp_stop + _gsSqueakTemp_arrayInstSize.
			_gsSqueakTemp_srcDelta := _gsSqueakTemp_replStart + _gsSqueakTemp_replInstSize - _gsSqueakTemp_start.
			(objectMemory isOldObject: _gsSqueakTemp_array)
				ifTrue: [| mustRemember oop |
					mustRemember := false.
					_gsSqueakTemp_start - 1
						to: _gsSqueakTemp_stop - 1
						do: [:i | 
							oop := objectMemory fetchPointer: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl.
							(objectMemory isYoung: oop)
								ifTrue: [mustRemember := true].
							objectMemory
								storePointerUnchecked: i
								ofObject: _gsSqueakTemp_array
								withValue: oop].
					mustRemember
						ifTrue: [objectMemory possibleRootStoreInto: _gsSqueakTemp_array]]
				ifFalse: [_gsSqueakTemp_start - 1
						to: _gsSqueakTemp_stop - 1
						do: [:i | objectMemory
								storePointerUnchecked: i
								ofObject: _gsSqueakTemp_array
								withValue: (objectMemory fetchPointer: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl)]]]
		ifFalse: [(_gsSqueakTemp_start >= 1
					and: [_gsSqueakTemp_start - 1 <= _gsSqueakTemp_stop
							and: [_gsSqueakTemp_stop <= _gsSqueakTemp_arrayLength
									and: [_gsSqueakTemp_replStart >= 1
											and: [_gsSqueakTemp_stop - _gsSqueakTemp_start + _gsSqueakTemp_replStart <= _gsSqueakTemp_replLength]]]])
				ifFalse: [^ self primitiveFailFor: PrimErrBadIndex].
			_gsSqueakTemp_srcDelta := _gsSqueakTemp_replStart - _gsSqueakTemp_start.
			_gsSqueakTemp_arrayFmt >= objectMemory firstShortFormat
				ifTrue: ["8 & 16-bit word type objects"
					_gsSqueakTemp_arrayFmt >= objectMemory firstByteFormat
						ifTrue: ["byte-type objects"
							_gsSqueakTemp_start - 1
								to: _gsSqueakTemp_stop - 1
								do: [:i | objectMemory
										storeByte: i
										ofObject: _gsSqueakTemp_array
										withValue: (objectMemory fetchByte: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl)]]
						ifFalse: ["short type objects"
							_gsSqueakTemp_start - 1
								to: _gsSqueakTemp_stop - 1
								do: [:i | objectMemory
										storeShort16: i
										ofObject: _gsSqueakTemp_array
										withValue: (objectMemory fetchShort16: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl)]]]
				ifFalse: ["32 & 64-bit word type objects"
					_gsSqueakTemp_arrayFmt >= objectMemory firstLongFormat
						ifTrue: ["word-type objects"
							_gsSqueakTemp_start - 1
								to: _gsSqueakTemp_stop - 1
								do: [:i | objectMemory
										storeLong32: i
										ofObject: _gsSqueakTemp_array
										withValue: (objectMemory fetchLong32: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl)]]
						ifFalse: ["long type objects"
							_gsSqueakTemp_start - 1
								to: _gsSqueakTemp_stop - 1
								do: [:i | objectMemory
										storeLong64: i
										ofObject: _gsSqueakTemp_array
										withValue: (objectMemory fetchLong64: _gsSqueakTemp_srcDelta + i ofObject: _gsSqueakTemp_repl)]]]].
	"We might consider comparing stop - start to some value here and
	using forceInterruptCheck"
	self pop: argumentCount
	"leave rcvr on stack"