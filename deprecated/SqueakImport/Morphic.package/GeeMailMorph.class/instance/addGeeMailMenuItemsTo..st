as yet unclassified
addGeeMailMenuItemsTo: menu

	self flag: #convertToBook.	"<-- no longer used"
	menu 
		addUpdating: #showPageBreaksString action: #togglePageBreaks;
		addUpdating: #keepScrollbarString action: #toggleKeepScrollbar;
		addLine;
		add: 'Print...' translated action: #printPSToFile;
		addLine.
	thePasteUp allTextPlusMorphs size = 1 ifTrue: [
		menu add: 'make 1-column book' translated selector: #makeBookStyle: argument: 1.
		menu add: 'make 2-column book' translated selector: #makeBookStyle: argument: 2.
		menu add: 'make 3-column book' translated selector: #makeBookStyle: argument: 3.
		menu add: 'make 4-column book' translated selector: #makeBookStyle: argument: 4.
	] ifFalse: [
		menu add: 'make a galley of me' translated action: #makeGalleyStyle.
	].
	^menu