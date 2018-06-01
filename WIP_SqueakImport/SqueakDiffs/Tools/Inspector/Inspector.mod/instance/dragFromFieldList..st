drag-drop
dragFromFieldList: index
	selectionIndex = index ifFalse: [self toggleIndex: index].
	^self selection