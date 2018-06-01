accessing
indexUpdateBlock: aBlockOrNil
	"aBlockOrNil is either nil or a two argument block. The first argument is the object whose index has changed in the heap, the second is the new index. The block will be evaluated whenever an element is moved in the heap's internal array. If you don't plan to remove elements by index (see #removeAt:), then you should not set this block."

	indexUpdateBlock := aBlockOrNil.

