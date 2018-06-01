multi-window support
restoreToPackage: packageNameOrNil category: category className: className protocol: protocol selector: selector mode: editMode meta: metaBool
	self packageListIndex: (self packageList indexOf: packageNameOrNil).
	super restoreToCategory: category className: className protocol: protocol selector: selector mode: editMode meta: metaBool