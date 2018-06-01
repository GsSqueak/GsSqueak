undo
replaceSelectionWith: aText 
	"Remember the selection text in UndoSelection.
	Deselect, and replace the selection text by aText.
	Remember the resulting selectionInterval in UndoInterval and
	PriorInterval. Set up undo to use UndoReplace."
	self openTypeIn.
	self zapSelectionWith: aText.
	self closeTypeIn