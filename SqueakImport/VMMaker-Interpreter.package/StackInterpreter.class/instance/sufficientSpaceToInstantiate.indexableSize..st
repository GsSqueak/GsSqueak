object access primitives
sufficientSpaceToInstantiate: classOop indexableSize: size 
	"Return the number of bytes required to allocate an instance of the given class with the given number of indexable fields."
	"Details: For speed, over-estimate space needed for fixed fields or literals; the low space threshold is a blurry line."
	| format atomSize|
	<inline: true>
	format := self instSpecOfClass: classOop.

	"fail if attempting to call new: on non-indexable class"
	((self cCoerce: size to: 'usqInt ') > 0 and: [format < 2])
		ifTrue: [^ false].

	format < 8
		ifTrue: ["indexable fields are words or pointers" atomSize := objectMemory bytesPerWord]
		ifFalse: ["indexable fields are bytes" atomSize := 1].
	^objectMemory sufficientSpaceToAllocate: 2500 + (size * atomSize)