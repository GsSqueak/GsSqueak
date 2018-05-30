multi-window support
restoreToCategory: category className: className protocol: protocol selector: selector mode: editMode meta: metaBool
	selectedSystemCategory := nil. "forces recomputation in selectSystemCategory:"
	self selectSystemCategory: category.
	self selectClassNamed: className.
	self metaClassIndicated: metaBool.
	self selectMessageCategoryNamed: protocol.
	self selectMessageNamed: selector.
	editSelection := editMode.
	self
		contentsChanged;
		decorateButtons