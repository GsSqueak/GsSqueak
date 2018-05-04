interpreter access
fetchPointer: fieldIndex ofObject: oop
	"In simulation, an interpreter simulator serves as the interpreter proxy"
	^objectMemory fetchPointer: fieldIndex ofObject: oop