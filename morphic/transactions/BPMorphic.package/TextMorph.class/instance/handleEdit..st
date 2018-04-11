editing
handleEdit: editBlock 
	"Ensure that changed areas get suitably redrawn"
	| _gsSqueakTemp_result |
	self selectionChanged.
	"Note old selection"
	_gsSqueakTemp_result := editBlock value.
	self selectionChanged.
	"Note new selection"
	self updateFromParagraph.
	"Propagate changes as necessary"
	^ _gsSqueakTemp_result