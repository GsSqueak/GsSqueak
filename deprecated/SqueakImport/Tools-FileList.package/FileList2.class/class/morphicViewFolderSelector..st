morphic ui
morphicViewFolderSelector: aDir
	"Answer a tool that allows the user to select a folder"

	| aFileList window fixedSize |
	aFileList := self new directory: aDir.
	aFileList optionalButtonSpecs: aFileList servicesForFolderSelector.
	window := (SystemWindow labelled: aDir pathName) model: aFileList.
	aFileList modalView: window.

	fixedSize := 25.
	self addFullPanesTo: window from: {
		{self textRow: 'Please select a folder'. 0 @ 0 corner: 1 @ 0. 
				0@0 corner: 0@fixedSize}.
		{aFileList optionalButtonRow. 0 @ 0 corner: 1 @ 0. 
				0@fixedSize corner: 0@(fixedSize * 2)}.
		{aFileList morphicDirectoryTreePane. 0@0 corner: 1@1.
				0@(fixedSize * 2) corner: 0@0}.
	}.
	aFileList postOpen.
	^ window 