menu
addBookMenuItemsTo: aMenu hand: aHandMorph 
	| _gsSqueakTemp_controlsShowing _gsSqueakTemp_subMenu |
	_gsSqueakTemp_subMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_subMenu add: 'previous page' translated action: #previousPage.
	_gsSqueakTemp_subMenu add: 'next page' translated action: #nextPage.
	_gsSqueakTemp_subMenu add: 'goto page' translated action: #goToPage.
	_gsSqueakTemp_subMenu add: 'insert a page' translated action: #insertPage.
	_gsSqueakTemp_subMenu add: 'delete this page' translated action: #deletePage.
	_gsSqueakTemp_controlsShowing := self hasSubmorphWithProperty: #pageControl.
	_gsSqueakTemp_controlsShowing
		ifTrue: [_gsSqueakTemp_subMenu add: 'hide page controls' translated action: #hidePageControls.
			_gsSqueakTemp_subMenu add: 'fewer page controls' translated action: #fewerPageControls]
		ifFalse: [_gsSqueakTemp_subMenu add: 'show page controls' translated action: #showPageControls].
	self isInFullScreenMode
		ifTrue: [_gsSqueakTemp_subMenu add: 'exit full screen' translated action: #exitFullScreen]
		ifFalse: [_gsSqueakTemp_subMenu add: 'show full screen' translated action: #goFullScreen].
	_gsSqueakTemp_subMenu addLine.
	_gsSqueakTemp_subMenu add: 'sound effect for all pages' translated action: #menuPageSoundForAll:.
	_gsSqueakTemp_subMenu add: 'sound effect this page only' translated action: #menuPageSoundForThisPage:.
	_gsSqueakTemp_subMenu add: 'visual effect for all pages' translated action: #menuPageVisualForAll:.
	_gsSqueakTemp_subMenu add: 'visual effect this page only' translated action: #menuPageVisualForThisPage:.
	_gsSqueakTemp_subMenu addLine.
	_gsSqueakTemp_subMenu add: 'sort pages' translated action: #sortPages:.
	_gsSqueakTemp_subMenu add: 'uncache page sorter' translated action: #uncachePageSorter.
	(self hasProperty: #dontWrapAtEnd)
		ifTrue: [_gsSqueakTemp_subMenu
				add: 'wrap after last page' translated
				selector: #setWrapPages:
				argument: true]
		ifFalse: [_gsSqueakTemp_subMenu
				add: 'stop at last page' translated
				selector: #setWrapPages:
				argument: false].
	_gsSqueakTemp_subMenu addLine.
	_gsSqueakTemp_subMenu add: 'search for text' translated action: #textSearch.
	(aHandMorph pasteBuffer class isKindOf: PasteUpMorph class)
		ifTrue: [_gsSqueakTemp_subMenu add: 'paste book page' translated action: #pasteBookPage].
	_gsSqueakTemp_subMenu add: 'send all pages to server' translated action: #savePagesOnURL.
	_gsSqueakTemp_subMenu add: 'send this page to server' translated action: #saveOneOnURL.
	_gsSqueakTemp_subMenu add: 'reload all from server' translated action: #reload.
	_gsSqueakTemp_subMenu add: 'copy page url to clipboard' translated action: #copyUrl.
	_gsSqueakTemp_subMenu add: 'keep in one file' translated action: #keepTogether.
	_gsSqueakTemp_subMenu add: 'save as new-page prototype' translated action: #setNewPagePrototype.
	newPagePrototype
		ifNotNil: [_gsSqueakTemp_subMenu add: 'clear new-page prototype' translated action: #clearNewPagePrototype].
	aMenu add: 'book...' translated subMenu: _gsSqueakTemp_subMenu