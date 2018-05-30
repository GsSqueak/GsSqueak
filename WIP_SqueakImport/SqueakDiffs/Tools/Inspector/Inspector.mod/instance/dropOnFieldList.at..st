drag-drop
dropOnFieldList: anObject at: index
	selectionIndex = index ifFalse: [self toggleIndex: index].
	self replaceSelectionValue: anObject.
	self changed: #contents.
	^ true