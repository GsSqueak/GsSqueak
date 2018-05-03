debugging traps
eeAllocate: byteSize headerSize: hdrSize h1: baseHeader h2: classOop h3: extendedSize doFill: doFill format: format
	| newObj |
	newObj := super eeAllocate: byteSize headerSize: hdrSize h1: baseHeader h2: classOop h3: extendedSize doFill: doFill format: format.
	"newObj = 22163268 ifTrue: [self halt]."
	"byteCount < 600000 ifTrue: [^ newObj]."
	"(self baseHeader: newObj) =  16r0FCC0600 ifTrue: [self halt]."
	^newObj