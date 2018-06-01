editing
handleEdit: editBlock
	"Ensure that changed areas get suitably redrawn"
	| result |
	self selectionChanged.  "Note old selection"
	result := editBlock value.
	self selectionChanged.  "Note new selection"
	self updateFromParagraph.  "Propagate changes as necessary"
	^result