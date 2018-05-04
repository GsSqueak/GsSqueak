debugging traps
allocate: byteSize headerSize: hdrSize h1: baseHeader h2: classOop h3: extendedSize doFill: doFill with: fillWord 

	| newObj |
	newObj := objectMemory allocate: byteSize headerSize: hdrSize h1: baseHeader h2: classOop h3: extendedSize doFill: doFill with: fillWord.
	"byteCount < 600000 ifTrue: [^ newObj]."
	"(self baseHeader: newObj) =  16r0FCC0600 ifTrue: [self halt]."
	^ newObj