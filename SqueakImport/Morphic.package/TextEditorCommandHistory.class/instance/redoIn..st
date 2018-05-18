undo/redo
redoIn: editor

	self hasNext ifFalse: [^ self].
	
	[self current redoIn: editor]
		ensure: [currentIndex := currentIndex + 1].

	self previous isCompositeRedo == true ifTrue: [self redoIn: editor].