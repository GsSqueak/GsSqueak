list management
unselectRow: index
	"unselect the index-th row"
	selectedRows remove: index ifAbsent: [].
	preSelectedRow := nil.
	self changed.