menus
addCopyItemsTo: aMenu 
	"Add copy-like items to the halo menu"
	| subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	subMenu add: 'copy to paste buffer' translated action: #copyToPasteBuffer:.
	subMenu add: 'copy text' translated action: #clipText.
	subMenu add: 'copy Postscript' translated action: #clipPostscript.
	subMenu
		add: 'print Postscript to file...' translated
		target: self
		selector: #printPSToFile.
	aMenu add: 'copy & print...' translated subMenu: subMenu