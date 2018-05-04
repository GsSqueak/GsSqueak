object format
instSpecOfClass: classPointer
	"This is the same as the field stored in every object header"

	^(objectMemory formatOfClass: classPointer) >> 8 bitAnd: 16rF