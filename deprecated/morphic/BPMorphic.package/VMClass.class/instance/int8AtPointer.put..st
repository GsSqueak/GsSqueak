memory access
int8AtPointer: pointer put: value 
	"This gets implemented by Macros in C, where its types will also be
	checked. pointer is a raw address, and the result is an 16 bit integer."
	^ self at: pointer put: value