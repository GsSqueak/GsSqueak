list management
selectRow: index
	" Select the index-th row. Clear the pre selection highlight. "
	selectedRows add: index.
	preSelectedRow := nil.
	self changed.