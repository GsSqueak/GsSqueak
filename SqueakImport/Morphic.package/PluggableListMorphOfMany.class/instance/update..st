updating
update: aSymbol 
	aSymbol == #allSelections ifTrue:
		[self selectionIndex: self getCurrentSelectionIndex.
		^ self changed].
	^ super update: aSymbol