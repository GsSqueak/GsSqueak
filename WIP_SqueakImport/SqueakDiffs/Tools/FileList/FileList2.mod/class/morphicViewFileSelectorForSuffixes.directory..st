morphic ui
morphicViewFileSelectorForSuffixes: aList directory: dir
	"Answer a morphic file-selector tool for the given suffix list and the given directory."

	| aFileList window fixedSize midLine gap |
	aFileList := self new directory: dir.
	aFileList optionalButtonSpecs: aFileList okayAndCancelServices.
	aList ifNotNil:
		[aFileList fileSelectionBlock: [:entry :myPattern |
			entry isDirectory
				ifTrue:
					[false]
				ifFalse:
					[aList includes: (FileDirectory extensionFor: entry name asLowercase)]]].
	window := BorderedMorph new
		layoutPolicy: ProportionalLayout new;
		color: Color lightBlue;
		borderColor: Color blue;
		borderWidth: 4;
		layoutInset: 4;
		extent: 600@400;
		useRoundedCorners.
	window setProperty: #fileListModel toValue: aFileList.
	aFileList modalView: window.
	midLine := 0.4.
	fixedSize := 25.
	gap := 5.
	self addFullPanesTo: window from: {
		{self textRow: 'Please select a file'. 0 @ 0 corner: 1 @ 0. 0@0 corner: 0@fixedSize}.
		{aFileList optionalButtonRow. 0 @ 0 corner: 1 @ 0. 0@fixedSize corner: 0@(fixedSize * 2)}.
		{aFileList morphicDirectoryTreePane. 0@0 corner: midLine@1. 
					gap @(fixedSize * 2) corner: gap negated@0}.
		{aFileList morphicFileListPane. midLine @ 0 corner: 1@1. 
					gap@(fixedSize * 2) corner: gap negated@0}.
	}.

	aFileList postOpen.

	^ window 