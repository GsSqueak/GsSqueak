undo/redo
undoIn: editor 
	self hasPrevious
		ifFalse: [^ self].
	currentIndex := currentIndex - 1.
	self current undoIn: editor.
	self current isCompositeUndo == true
		ifTrue: [self undoIn: editor]