interpreter access
fetchByte: byteIndex ofObject: oop
	"In simulation, an interpreter simulator serves as the interpreter proxy"
	^ objectMemory fetchByte: byteIndex ofObject: oop