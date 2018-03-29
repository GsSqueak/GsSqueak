indexing primitive support
stSizeOf: oop 
	"Return the number of indexable fields in the given object. (i.e., what
	Smalltalk would return for <obj> size)."
	"Note: Assume oop is not a SmallInteger!"
	| _gsSqueakTemp_hdr _gsSqueakTemp_fmt _gsSqueakTemp_totalLength _gsSqueakTemp_fixedFields |
	_gsSqueakTemp_hdr := objectMemory baseHeader: oop.
	_gsSqueakTemp_fmt := objectMemory formatOfHeader: _gsSqueakTemp_hdr.
	_gsSqueakTemp_totalLength := objectMemory
				lengthOf: oop
				baseHeader: _gsSqueakTemp_hdr
				format: _gsSqueakTemp_fmt.
	_gsSqueakTemp_fixedFields := objectMemory
				fixedFieldsOf: oop
				format: _gsSqueakTemp_fmt
				length: _gsSqueakTemp_totalLength.
	_gsSqueakTemp_fmt = objectMemory indexablePointersFormat
		ifTrue: [self assert: (objectMemory isContextHeader: _gsSqueakTemp_hdr) not].
	^ _gsSqueakTemp_totalLength - _gsSqueakTemp_fixedFields