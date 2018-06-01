list management
preSelectedRow: index
	" Show the user which row is about to become selected, thus providing feedback if there is a delay between the selection gesture and the actual selection of the row. "
	
	preSelectedRow := index.
	self changed.