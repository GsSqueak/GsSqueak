indexing primitive support
characterForAscii: ascii 
	"Above ObjectMemory, arg must lie in range 0-255!"
	^ CharacterTable
		ifNil: [objectMemory characterObjectOf: ascii]
		ifNotNil: [objectMemory fetchPointer: ascii ofObject: objectMemory characterTable]