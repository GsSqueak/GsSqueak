list management
selectedRow: index
	" Select the index-th row. Clear the pre selection highlight. If nil, remove the current selection. "
	selectedRow := index.
	preSelectedRow := nil.
	self changed.