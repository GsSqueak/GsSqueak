menu
invokeBookMenu
	"Invoke the book's control panel menu."
	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Book' translated.
	Preferences noviceMode
		ifFalse:[aMenu addStayUpItem].
	aMenu add: 'find...' translated action: #textSearch.
	aMenu add: 'go to page...' translated action: #goToPage.
	aMenu addLine.

	aMenu addList: {
		{'sort pages' translated.		#sortPages}.
		{'uncache page sorter' translated.	#uncachePageSorter}}.
	(self hasProperty: #dontWrapAtEnd)
		ifTrue: [aMenu add: 'wrap after last page' translated selector: #setWrapPages: argument: true]
		ifFalse: [aMenu add: 'stop at last page' translated selector: #setWrapPages: argument: false].
	aMenu addList: {
		{'make bookmark' translated.		#bookmarkForThisPage}.
		{'make thumbnail' translated.		#thumbnailForThisPage}}.
	aMenu addUpdating: #showingPageControlsString action: #toggleShowingOfPageControls.
	aMenu addUpdating: #showingFullScreenString action: #toggleFullScreen.

	aMenu addLine.
	aMenu add: 'sound effect for all pages' translated action: #menuPageSoundForAll:.
	aMenu add: 'sound effect this page only' translated action: #menuPageSoundForThisPage:.
	aMenu add: 'visual effect for all pages' translated action: #menuPageVisualForAll:.
	aMenu add: 'visual effect this page only' translated action: #menuPageVisualForThisPage:.

	aMenu addLine.
	(self primaryHand pasteBuffer class isKindOf: PasteUpMorph class) ifTrue:
		[aMenu add: 'paste book page' translated   action: #pasteBookPage].

	aMenu add: 'save as new-page prototype' translated action: #setNewPagePrototype.
	newPagePrototype ifNotNil: [
		aMenu add: 'clear new-page prototype' translated action: #clearNewPagePrototype].

	aMenu add: (self dragNDropEnabled ifTrue: ['close dragNdrop'] ifFalse: ['open dragNdrop']) translated
			action: #toggleDragNDrop.
	aMenu add: 'make all pages this size' translated action: #makeUniformPageSize.
	
	aMenu
		addUpdating: #keepingUniformPageSizeString
		target: self
		action: #toggleMaintainUniformPageSize.
	aMenu addLine.

	aMenu add: 'send all pages to server' translated action: #savePagesOnURL.
	aMenu add: 'send this page to server' translated action: #saveOneOnURL.
	aMenu add: 'reload all from server' translated action: #reload.
	aMenu add: 'copy page url to clipboard' translated action: #copyUrl.
	aMenu add: 'keep in one file' translated action: #keepTogether.

	aMenu addLine.
	aMenu add: 'load PPT images from slide #1' translated action: #loadImagesIntoBook.
	aMenu add: 'background color for all pages...' translated action: #setPageColor.
	aMenu add: 'make a thread of projects in this book' translated action: #buildThreadOfProjects.

	aMenu popUpEvent: self world activeHand lastEvent in: self world
