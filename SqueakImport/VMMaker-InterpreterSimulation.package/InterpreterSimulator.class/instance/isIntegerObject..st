interpreter access
isIntegerObject: objectPointer
	"In simulation, an interpreter simulator serves as the interpreter proxy"
	^ objectMemory isIntegerObject: objectPointer