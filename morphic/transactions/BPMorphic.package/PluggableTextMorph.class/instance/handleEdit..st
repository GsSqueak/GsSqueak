editor access
handleEdit: editBlock 
	| _gsSqueakTemp_result |
	textMorph editor selectFrom: selectionInterval first to: selectionInterval last;
		 model: model.
	"For, eg, evaluateSelection"
	_gsSqueakTemp_result := textMorph handleEdit: editBlock.
	"Update selection after edit"
	self scrollSelectionIntoView.
	^ _gsSqueakTemp_result