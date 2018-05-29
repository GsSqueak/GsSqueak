as yet unclassified
rebuildPages

	pages := self geePageRectangles collect: [ :each |
		GeeBookPageMorph new 
			disableDragNDrop;
			geeMail: geeMail geeMailRectangle: each.
	].
	currentPage delete.
	currentPage := nil.
	pages isEmpty ifTrue: [^ self insertPage].
	self goToPage: 1.

