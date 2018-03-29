indexing primitive support
install: rcvr inAtCache: cache at: atIx string: stringy 
	"Attempt to install the oop of this object in the given cache (at or
	atPut), along with its size, format and fixedSize. Answer if this was
	successful. "
	| _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_totalLength _gsSqueakTemp_fixedFields |
	self assert: (objectMemory isContext: rcvr) not.
	_gsSqueakTemp_hdr := objectMemory baseHeader: rcvr.
	_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	"For now the AtCache code doesn't support 16-bit indexability."
	(objectMemory hasSpurMemoryManagerAPI
			and: [_gsSqueakTemp_fmt between: objectMemory firstShortFormat and: objectMemory firstByteFormat - 1])
		ifTrue: [^ self primitiveFail].
	stringy
		ifTrue: [_gsSqueakTemp_totalLength := objectMemory
						lengthOf: rcvr
						baseHeader: _gsSqueakTemp_hdr
						format: _gsSqueakTemp_fmt.
			_gsSqueakTemp_fixedFields := 0.
			_gsSqueakTemp_fmt := _gsSqueakTemp_fmt + objectMemory firstStringyFakeFormat
			"special flag for strings"]
		ifFalse: [(_gsSqueakTemp_fmt = objectMemory indexablePointersFormat
					and: [objectMemory isContextHeader: _gsSqueakTemp_hdr])
				ifTrue: ["Contexts must not be put in the atCache, since their
					size is not constant"
					self primitiveFailFor: PrimErrBadReceiver.
					^ false].
			_gsSqueakTemp_totalLength := objectMemory
						lengthOf: rcvr
						baseHeader: _gsSqueakTemp_hdr
						format: _gsSqueakTemp_fmt.
			_gsSqueakTemp_fixedFields := objectMemory
						fixedFieldsOf: rcvr
						format: _gsSqueakTemp_fmt
						length: _gsSqueakTemp_totalLength].
	cache at: atIx + AtCacheOop put: rcvr.
	cache at: atIx + AtCacheFmt put: _gsSqueakTemp_fmt.
	cache at: atIx + AtCacheFixedFields put: _gsSqueakTemp_fixedFields.
	cache at: atIx + AtCacheSize put: _gsSqueakTemp_totalLength - _gsSqueakTemp_fixedFields.
	^ true