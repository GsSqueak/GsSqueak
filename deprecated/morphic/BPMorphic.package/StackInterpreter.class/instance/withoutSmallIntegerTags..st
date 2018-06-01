frame access
withoutSmallIntegerTags: anInteger 
	self
		assert: (objectMemory isIntegerObject: anInteger).
	^ self pointerForOop: anInteger - 1