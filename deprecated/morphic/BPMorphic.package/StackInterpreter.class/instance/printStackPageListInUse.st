debug printing
printStackPageListInUse
	| _gsSqueakTemp_page _gsSqueakTemp_n |
	_gsSqueakTemp_page := stackPages mostRecentlyUsedPage.
	_gsSqueakTemp_n := 0.
	[(stackPages isFree: _gsSqueakTemp_page)
		ifFalse: [self printStackPage: _gsSqueakTemp_page useCount: (_gsSqueakTemp_n := _gsSqueakTemp_n + 1);
				 cr].
	(_gsSqueakTemp_page := _gsSqueakTemp_page prevPage) ~= stackPages mostRecentlyUsedPage] whileTrue