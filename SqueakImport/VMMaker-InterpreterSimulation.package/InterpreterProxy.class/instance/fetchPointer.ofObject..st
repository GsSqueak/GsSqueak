object access
fetchPointer: index ofObject: oop
	"index by word size, and return a pointer as long as the word size"
	^oop instVarAt: index+1