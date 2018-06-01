accessing
hoverItem

	^ self hoverRow = 0
		ifTrue: [nil]
		ifFalse: [self getListItem: self hoverRow]