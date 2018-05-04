object access primitives
sufficientSpaceToInstantiate: classOop indexableSize: size 
	"Return true if there is enough space to allocate an instance of the given class with the given number of indexable fields."
	"Details: For speed, over-estimate space needed for fixed fields or literals; the low space threshold is a blurry line."
	| format |
	<inline: true>
	<var: #size type: 'usqInt'>
	<var: #bytesNeeded type: 'usqInt'>
	format := (objectMemory formatOfClass: classOop) >> 8 bitAnd: 16rF.

	"Fail if attempting to call new: on non-indexable class"
	(size > 0 and: [format < 2])
		ifTrue: [^ false].

	format < 8
		ifTrue: ["indexable fields are words or pointers"
				(objectMemory isExcessiveAllocationRequest: size shift: objectMemory shiftForWord) ifTrue: [^ false].
				^ objectMemory sufficientSpaceToAllocate: 2500 + (size * objectMemory bytesPerWord)]
		ifFalse: ["indexable fields are bytes"
				(objectMemory isExcessiveAllocationRequest: size shift: 0) ifTrue: [^ false].
				^ objectMemory sufficientSpaceToAllocate: 2500 + size]
