editor access
handleEdit: editBlock
	| result |
	textMorph editor selectFrom: selectionInterval first to: selectionInterval last;
						model: model.  "For, eg, evaluateSelection"
	result := textMorph handleEdit: editBlock.   "Update selection after edit"
	self scrollSelectionIntoView.
	^ result