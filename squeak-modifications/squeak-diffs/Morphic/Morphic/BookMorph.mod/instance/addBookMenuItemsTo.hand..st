menu
addBookMenuItemsTo: aMenu hand: aHandMorph
	| controlsShowing subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'previous page' translated action: #previousPage.
	subMenu add: 'next page' translated action: #nextPage.
	subMenu add: 'goto page' translated action: #goToPage.
	subMenu add: 'insert a page' translated action: #insertPage.
	subMenu add: 'delete this page' translated action: #deletePage.

	controlsShowing := self hasSubmorphWithProperty: #pageControl.
	controlsShowing
		ifTrue:
			[subMenu add: 'hide page controls' translated action: #hidePageControls.
			subMenu add: 'fewer page controls' translated action: #fewerPageControls]
		ifFalse:
			[subMenu add: 'show page controls' translated action: #showPageControls].
	self isInFullScreenMode ifTrue: [
		subMenu add: 'exit full screen' translated action: #exitFullScreen.
	] ifFalse: [
		subMenu add: 'show full screen' translated action: #goFullScreen.
	].
	subMenu addLine.
	subMenu add: 'sound effect for all pages' translated action: #menuPageSoundForAll:.
	subMenu add: 'sound effect this page only' translated action: #menuPageSoundForThisPage:.
	subMenu add: 'visual effect for all pages' translated action: #menuPageVisualForAll:.
	subMenu add: 'visual effect this page only' translated action: #menuPageVisualForThisPage:.

	subMenu addLine.
	subMenu add: 'sort pages' translated action: #sortPages:.
	subMenu add: 'uncache page sorter' translated action: #uncachePageSorter.
	(self hasProperty: #dontWrapAtEnd)
		ifTrue: [subMenu add: 'wrap after last page' translated selector: #setWrapPages: argument: true]
		ifFalse: [subMenu add: 'stop at last page' translated selector: #setWrapPages: argument: false].

	subMenu addLine.
	subMenu add: 'search for text' translated action: #textSearch.
	(aHandMorph pasteBuffer class isKindOf: PasteUpMorph class) ifTrue:
		[subMenu add: 'paste book page' translated	action: #pasteBookPage].

	subMenu add: 'send all pages to server' translated action: #savePagesOnURL.
	subMenu add: 'send this page to server' translated action: #saveOneOnURL.
	subMenu add: 'reload all from server' translated action: #reload.
	subMenu add: 'copy page url to clipboard' translated action: #copyUrl.
	subMenu add: 'keep in one file' translated action: #keepTogether.
	subMenu add: 'save as new-page prototype' translated action: #setNewPagePrototype.
	newPagePrototype ifNotNil:
		[subMenu add: 'clear new-page prototype' translated action: #clearNewPagePrototype].

	aMenu add: 'book...' translated subMenu: subMenu
