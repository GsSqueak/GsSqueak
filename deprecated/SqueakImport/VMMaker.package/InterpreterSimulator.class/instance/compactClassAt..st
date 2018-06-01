debug support
compactClassAt: ccIndex
	"Index must be between 1 and compactClassArray size. (A zero compact class index in the base header indicate that the class is in the class header word.)"

	| classArray |
	classArray := objectMemory fetchPointer: CompactClasses ofObject: objectMemory getSpecialObjectsOop.
	^ objectMemory fetchPointer: (ccIndex - 1) ofObject: classArray