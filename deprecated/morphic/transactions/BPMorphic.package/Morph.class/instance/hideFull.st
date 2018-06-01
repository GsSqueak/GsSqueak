-widgets
hideFull
	"The hidden morph will not be drawn AND does not consume space in
	table layouts."
	self hide; disableTableLayout: true.
	"Workaround if #fullBounds are nil. See Morph>>#layoutChanged.
	Owner MUST BE notified."
	self owner
		ifNotNil: [:o | o layoutChanged]