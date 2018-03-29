indexing primitives
primitiveCompareBytes
	"Primitive. Compare two byte-indexed objects for equality"
	| _gsSqueakTemp_arg1 _gsSqueakTemp_arg2 _gsSqueakTemp_len1 _gsSqueakTemp_len2 |
	argumentCount = 1
		ifFalse: [self primitiveFail.
			^ self].
	_gsSqueakTemp_arg1 := self stackValue: 1.
	_gsSqueakTemp_arg2 := self stackValue: 0.
	((objectMemory isBytes: _gsSqueakTemp_arg1)
			and: [objectMemory isBytes: _gsSqueakTemp_arg2])
		ifFalse: [self primitiveFail.
			^ self].
	"Quick identity test"
	_gsSqueakTemp_arg1 = _gsSqueakTemp_arg2
		ifTrue: [^ self pop: 2 thenPush: objectMemory trueObject].
	_gsSqueakTemp_len1 := objectMemory byteSizeOf: _gsSqueakTemp_arg1.
	_gsSqueakTemp_len2 := objectMemory byteSizeOf: _gsSqueakTemp_arg2.
	_gsSqueakTemp_len1 = _gsSqueakTemp_len2
		ifFalse: [^ self pop: 2 thenPush: objectMemory falseObject].
	0
		to: _gsSqueakTemp_len1 - 1
		do: [:i | (objectMemory fetchByte: i ofObject: _gsSqueakTemp_arg1)
					= (objectMemory fetchByte: i ofObject: _gsSqueakTemp_arg2)
				ifFalse: [^ self pop: 2 thenPush: objectMemory falseObject]].
	self pop: 2 thenPush: objectMemory trueObject