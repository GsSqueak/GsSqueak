layout-menu
hasReverseCellsString
	^ (self reverseTableCells
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'reverse table cells' translated