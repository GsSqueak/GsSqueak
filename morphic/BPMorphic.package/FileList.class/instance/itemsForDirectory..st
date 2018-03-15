file list menu
itemsForDirectory: dir 
	| _gsSqueakTemp_services |
	_gsSqueakTemp_services := OrderedCollection new.
	dir
		ifNotNil: [_gsSqueakTemp_services
				addAll: (self class itemsForDirectory: dir).
			_gsSqueakTemp_services last useLineAfter: true].
	_gsSqueakTemp_services add: self serviceAddNewFile.
	_gsSqueakTemp_services add: self serviceAddNewDirectory.
	^ _gsSqueakTemp_services