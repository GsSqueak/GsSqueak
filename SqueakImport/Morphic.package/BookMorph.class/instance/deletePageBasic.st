insert and delete
deletePageBasic
	| thisPage |
	thisPage := self pageNumberOf: currentPage.
	pages remove: currentPage.
	currentPage delete.
	currentPage := nil.
	pages isEmpty ifTrue: [^ self insertPage].
	self goToPage: (thisPage min: pages size)
