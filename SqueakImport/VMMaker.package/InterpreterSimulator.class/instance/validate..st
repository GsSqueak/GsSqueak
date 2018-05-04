testing
validate: oop
	| header type cc sz fmt nextChunk | 
	header := objectMemory longAt: oop.
	type := header bitAnd: 3.
	type = 2 ifFalse: [type = (objectMemory rightType: header) ifFalse: [self halt]].
	sz := (header bitAnd: objectMemory sizeMask) >> 2.
	(objectMemory isFreeObject: oop)
		ifTrue: [ nextChunk := oop + (objectMemory sizeOfFree: oop) ]
		ifFalse: [  nextChunk := oop + (objectMemory sizeBitsOf: oop) ].
	nextChunk > objectMemory getEndOfMemory
		ifTrue: [oop = objectMemory getEndOfMemory ifFalse: [self halt]].
	(objectMemory headerType: nextChunk) = 0 ifTrue: [
		(objectMemory headerType: (nextChunk + (bytesPerWord * 2))) = 0 ifFalse: [self halt]].
	(objectMemory headerType: nextChunk) = 1 ifTrue: [
		(objectMemory headerType: (nextChunk + bytesPerWord)) = 1 ifFalse: [self halt]].
	type = 2 ifTrue:
		["free block" ^ self].
	fmt := (header >> 8) bitAnd: 16rF.
	cc := (header >> 12) bitAnd: 31.
	cc > 16 ifTrue: [self halt].	"up to 32 are legal, but not used"
	type = 0 ifTrue:
		["three-word header"
		((objectMemory longAt: oop - bytesPerWord) bitAnd: 3) = type ifFalse: [self halt].
		((objectMemory longAt: oop-(bytesPerWord * 2)) bitAnd: 3) = type ifFalse: [self halt].
		((objectMemory longAt: oop - bytesPerWord) = type) ifTrue: [self halt].	"Class word is 0"
		sz = 0 ifFalse: [self halt]].
	type = 1 ifTrue:
		["two-word header"
		((objectMemory longAt: oop - bytesPerWord) bitAnd: 3) = type ifFalse: [self halt].
		cc > 0 ifTrue: [sz = 1 ifFalse: [self halt]].
		sz = 0 ifTrue: [self halt]].
	type = 3 ifTrue:
		["one-word header"
		cc = 0 ifTrue: [self halt]].
	fmt = 5 ifTrue: [self halt].
	fmt = 7 ifTrue: [self halt].
	fmt >= 12 ifTrue:
		["CompiledMethod -- check for integer header"
		(objectMemory isIntegerObject: (objectMemory longAt: oop + bytesPerWord)) ifFalse: [self halt]].