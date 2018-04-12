accessing
columns: anArray 
	"You can specify columns or specs for columns. This depends on the
	actual morph that is used as item. ObjectExplorers produce items
	that support exact numbers, blocks, and nil for max width."
	columns := anArray.
	self clearColumnsCache