debug printing
printStackPageList
	| _gsSqueakTemp_page |
	_gsSqueakTemp_page := stackPages mostRecentlyUsedPage.
	[self printStackPage: _gsSqueakTemp_page.
	self cr.
	(_gsSqueakTemp_page := _gsSqueakTemp_page prevPage) ~= stackPages mostRecentlyUsedPage] whileTrue