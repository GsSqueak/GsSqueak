accessing
hoverItem
	^ self hoverRow = 0
		ifFalse: [self getListItem: self hoverRow]