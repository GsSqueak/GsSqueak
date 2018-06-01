file list menu
itemsForNoFile
	| _gsSqueakTemp_services |
	_gsSqueakTemp_services := OrderedCollection new.
	_gsSqueakTemp_services add: self serviceSortByName.
	_gsSqueakTemp_services add: self serviceSortBySize.
	_gsSqueakTemp_services
		add: (self serviceSortByDate useLineAfter: true).
	_gsSqueakTemp_services
		addAll: (self
				itemsForDirectory: (self isFileSelected
						ifFalse: [self directory])).
	^ _gsSqueakTemp_services