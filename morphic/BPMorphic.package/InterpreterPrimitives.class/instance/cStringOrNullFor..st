primitive support
cStringOrNullFor: oop 
	"Answer either a malloced string with the null-terminated contents of
	oop if oop is a string,
	or the null pointer if oop is nil, or fail. It is the client's responsibility to
	free the string later."
	| _gsSqueakTemp_isString _gsSqueakTemp_len _gsSqueakTemp_cString |
	_gsSqueakTemp_isString := self isInstanceOfClassByteString: oop.
	_gsSqueakTemp_isString
		ifFalse: [oop ~= objectMemory nilObject
				ifTrue: [self primitiveFailFor: PrimErrBadArgument].
			^ 0].
	_gsSqueakTemp_len := objectMemory lengthOf: oop.
	_gsSqueakTemp_len = 0
		ifTrue: [^ 0].
	_gsSqueakTemp_cString := self malloc: _gsSqueakTemp_len + 1.
	_gsSqueakTemp_cString
		ifNil: [self primitiveFailFor: PrimErrNoCMemory.
			^ 0].
	self
		mem: _gsSqueakTemp_cString
		cp: (objectMemory firstIndexableField: oop)
		y: _gsSqueakTemp_len.
	_gsSqueakTemp_cString
		at: (self
				cCode: [_gsSqueakTemp_len]
				inSmalltalk: [_gsSqueakTemp_len + 1])
		put: 0.
	^ _gsSqueakTemp_cString