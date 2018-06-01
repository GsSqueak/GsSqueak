undo
replace: xoldInterval with: newText and: selectingBlock 
	"Replace the text in oldInterval with newText and execute selectingBlock to establish the new selection.  Create an undoAndReselect:redoAndReselect: undoer to allow perfect undoing."

	| undoInterval |
	undoInterval := self selectionInterval.
	undoInterval = xoldInterval ifFalse: [self selectInterval: xoldInterval].
	
	self zapSelectionWith: newText.
	selectingBlock value.
	
	otherInterval := self selectionInterval.