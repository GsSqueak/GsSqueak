garbage collection
biasToGrow
	| growSize |
	<var: #growSize type: 'usqInt'>
	growSize :=  growHeadroom*3/2 - (self sizeOfFree: freeBlock).
	growSize > 0
		ifTrue: [self growObjectMemory: growSize]