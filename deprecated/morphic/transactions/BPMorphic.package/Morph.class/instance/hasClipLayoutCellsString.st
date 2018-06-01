layout-menu
hasClipLayoutCellsString
	^ (self clipLayoutCells
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'clip to cell size' translated