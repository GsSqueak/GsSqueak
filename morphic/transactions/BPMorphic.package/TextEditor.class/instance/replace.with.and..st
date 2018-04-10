undo
replace: xoldInterval with: newText and: selectingBlock 
	"Replace the text in oldInterval with newText and execute
	selectingBlock to establish the new selection. Create an
	undoAndReselect:redoAndReselect: undoer to allow perfect undoing."
	| _gsSqueakTemp_undoInterval |
	_gsSqueakTemp_undoInterval := self selectionInterval.
	_gsSqueakTemp_undoInterval = xoldInterval
		ifFalse: [self selectInterval: xoldInterval].
	self zapSelectionWith: newText.
	selectingBlock value.
	otherInterval := self selectionInterval