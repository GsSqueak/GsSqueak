menu
goToPage
	| _gsSqueakTemp_pageNum |
	_gsSqueakTemp_pageNum := UIManager default request: 'Page?' translated initialAnswer: '0'.
	_gsSqueakTemp_pageNum isEmptyOrNil
		ifTrue: [^ true].
	self goToPage: _gsSqueakTemp_pageNum asNumber