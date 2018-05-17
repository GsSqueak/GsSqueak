updating - system
displaySizeChanged
	self flag: #todo.
	self tinyDisplay
		ifTrue: [self enable: #scrollBarsNarrow]
		ifFalse: [self disable: #scrollBarsNarrow].
	self tinyDisplay 
		ifTrue:[self disable: #biggerHandles] 
		ifFalse:[self enable: #biggerHandles]