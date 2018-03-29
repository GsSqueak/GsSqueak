debug printing
printFramesOnStackPageListInUse
	| _gsSqueakTemp_page |
	_gsSqueakTemp_page := stackPages mostRecentlyUsedPage.
	[(stackPages isFree: _gsSqueakTemp_page)
		ifFalse: [self print: 'page ';
				
				printHexPtrnp: (self
						cCode: [_gsSqueakTemp_page]
						inSmalltalk: [_gsSqueakTemp_page baseAddress]);
				 cr.
			self printFramesInPage: _gsSqueakTemp_page.
			self cr].
	(_gsSqueakTemp_page := _gsSqueakTemp_page prevPage) ~= stackPages mostRecentlyUsedPage] whileTrue