menu
invokeBookMenu
	"Invoke the book's control panel menu."
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_aMenu addTitle: 'Book' translated.
	Preferences noviceMode
		ifFalse: [_gsSqueakTemp_aMenu addStayUpItem].
	_gsSqueakTemp_aMenu add: 'find...' translated action: #textSearch.
	_gsSqueakTemp_aMenu add: 'go to page...' translated action: #goToPage.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu addList: {{'sort pages' translated. #sortPages}. {'uncache page sorter' translated. #uncachePageSorter}}.
	(self hasProperty: #dontWrapAtEnd)
		ifTrue: [_gsSqueakTemp_aMenu
				add: 'wrap after last page' translated
				selector: #setWrapPages:
				argument: true]
		ifFalse: [_gsSqueakTemp_aMenu
				add: 'stop at last page' translated
				selector: #setWrapPages:
				argument: false].
	_gsSqueakTemp_aMenu addList: {{'make bookmark' translated. #bookmarkForThisPage}. {'make thumbnail' translated. #thumbnailForThisPage}}.
	_gsSqueakTemp_aMenu addUpdating: #showingPageControlsString action: #toggleShowingOfPageControls.
	_gsSqueakTemp_aMenu addUpdating: #showingFullScreenString action: #toggleFullScreen.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu add: 'sound effect for all pages' translated action: #menuPageSoundForAll:.
	_gsSqueakTemp_aMenu add: 'sound effect this page only' translated action: #menuPageSoundForThisPage:.
	_gsSqueakTemp_aMenu add: 'visual effect for all pages' translated action: #menuPageVisualForAll:.
	_gsSqueakTemp_aMenu add: 'visual effect this page only' translated action: #menuPageVisualForThisPage:.
	_gsSqueakTemp_aMenu addLine.
	(self primaryHand pasteBuffer class isKindOf: PasteUpMorph class)
		ifTrue: [_gsSqueakTemp_aMenu add: 'paste book page' translated action: #pasteBookPage].
	_gsSqueakTemp_aMenu add: 'save as new-page prototype' translated action: #setNewPagePrototype.
	newPagePrototype
		ifNotNil: [_gsSqueakTemp_aMenu add: 'clear new-page prototype' translated action: #clearNewPagePrototype].
	_gsSqueakTemp_aMenu add: (self dragNDropEnabled
			ifTrue: ['close dragNdrop']
			ifFalse: ['open dragNdrop']) translated action: #toggleDragNDrop.
	_gsSqueakTemp_aMenu add: 'make all pages this size' translated action: #makeUniformPageSize.
	_gsSqueakTemp_aMenu
		addUpdating: #keepingUniformPageSizeString
		target: self
		action: #toggleMaintainUniformPageSize.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu add: 'send all pages to server' translated action: #savePagesOnURL.
	_gsSqueakTemp_aMenu add: 'send this page to server' translated action: #saveOneOnURL.
	_gsSqueakTemp_aMenu add: 'reload all from server' translated action: #reload.
	_gsSqueakTemp_aMenu add: 'copy page url to clipboard' translated action: #copyUrl.
	_gsSqueakTemp_aMenu add: 'keep in one file' translated action: #keepTogether.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu add: 'load PPT images from slide #1' translated action: #loadImagesIntoBook.
	_gsSqueakTemp_aMenu add: 'background color for all pages...' translated action: #setPageColor.
	_gsSqueakTemp_aMenu add: 'make a thread of projects in this book' translated action: #buildThreadOfProjects.
	_gsSqueakTemp_aMenu popUpEvent: self world activeHand lastEvent in: self world