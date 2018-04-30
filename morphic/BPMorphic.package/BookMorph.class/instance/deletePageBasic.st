insert and delete
deletePageBasic
	| _gsSqueakTemp_thisPage |
	_gsSqueakTemp_thisPage := self pageNumberOf: currentPage.
	pages remove: currentPage.
	currentPage delete.
	currentPage := nil.
	pages isEmpty
		ifTrue: [^ self insertPage].
	self
		goToPage: (_gsSqueakTemp_thisPage min: pages size)