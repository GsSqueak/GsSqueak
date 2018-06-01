keyboard control
selectMoreItem: evt 
	| _gsSqueakTemp_allItems _gsSqueakTemp_more |
	_gsSqueakTemp_allItems := self submorphs
				select: [:m | m isKindOf: MenuItemMorph].
	_gsSqueakTemp_more := _gsSqueakTemp_allItems
				detect: [:m | m contents size >= 4
						and: [(m contents first: 4) asString = 'more']]
				ifNone: [^ self flash].
	self selectItem: _gsSqueakTemp_more event: evt.
	selectedItem invokeWithEvent: evt