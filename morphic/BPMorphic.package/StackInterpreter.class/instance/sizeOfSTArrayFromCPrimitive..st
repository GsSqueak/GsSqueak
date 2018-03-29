utilities
sizeOfSTArrayFromCPrimitive: cPtr 
	"Return the number of indexable fields of the given object. This
	method is to be called from an automatically generated C primitive.
	The argument is assumed to be a pointer to the first indexable field of
	a words or bytes object; the object header starts 4 bytes before that."
	"Note: Only called by translated primitive code."
	| _gsSqueakTemp_oop |
	_gsSqueakTemp_oop := (self oopForPointer: cPtr)
				- objectMemory baseHeaderSize.
	(objectMemory isWordsOrBytes: _gsSqueakTemp_oop)
		ifFalse: [self primitiveFail.
			^ 0].
	^ objectMemory lengthOf: _gsSqueakTemp_oop