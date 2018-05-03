C library simulation
asString: aStringOrStringIndex 
	"aStringOrStringIndex is either a string or an address in the heap.
	Create a String of the requested length form the bytes in the
	heap starting at stringIndex."
	| _gsSqueakTemp_sz |
	aStringOrStringIndex isString
		ifTrue: [^ aStringOrStringIndex].
	_gsSqueakTemp_sz := self strlen: aStringOrStringIndex.
	^ self
		st: (ByteString new: _gsSqueakTemp_sz)
		rn: aStringOrStringIndex
		cpy: _gsSqueakTemp_sz