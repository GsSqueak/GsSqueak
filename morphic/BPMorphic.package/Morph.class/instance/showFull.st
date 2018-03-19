-widgets
showFull
	"The morph is visible again and considered in table layouts."
	self show; disableTableLayout: false.
	"Workaround if #fullBounds are nil. See Morph>>#layoutChanged.
	Owner MUST BE notified."
	self owner
		ifNotNil: [:o | o layoutChanged]