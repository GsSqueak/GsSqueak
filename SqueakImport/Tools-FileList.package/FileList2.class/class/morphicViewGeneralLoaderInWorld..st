blue ui
morphicViewGeneralLoaderInWorld: aWorld
"
FileList2 morphicViewGeneralLoaderInWorld: self currentWorld
"
	| window aFileList buttons treePane textColor1 fileListPane pane2a pane2b fileTypeInfo fileTypeButtons fileTypeRow actionRow |

	fileTypeInfo := self endingSpecs.
	window := AlignmentMorphBob1 newColumn.
	window hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	textColor1 := Color r: 0.742 g: 0.839 b: 1.0.
	aFileList := self new directory: FileDirectory default.
	aFileList 
		fileSelectionBlock: self projectOnlySelectionBlock;
		modalView: window.
	window
		setProperty: #FileList toValue: aFileList;
		wrapCentering: #center; cellPositioning: #topCenter;
		borderWidth: 1;
		borderColor: (Color r: 0.9 g: 0.801 b: 0.2);
		useRoundedCorners.

	fileTypeButtons := fileTypeInfo collect: [ :each |
		(self blueButtonText: each first textColor: Color gray inWindow: window)
			setProperty: #enabled toValue: true;
			hResizing: #shrinkWrap;
			useSquareCorners
	].
	buttons := {{'OK'. Color lightGreen}. {'Cancel'. Color lightRed}} collect: [ :each |
		self blueButtonText: each first textColor: textColor1 color: each second inWindow: window
	].

	treePane := aFileList morphicDirectoryTreePane 
		extent: 250@300; 
		retractable: false;
		borderWidth: 0.
	fileListPane := aFileList morphicFileListPane 
		extent: 350@300; 
		retractable: false;
		borderWidth: 0.
	window addARow: {window fancyText: 'Find...' translated font: Preferences standardEToysTitleFont color: textColor1}.
	fileTypeRow := window addARowCentered: fileTypeButtons cellInset: 2.
	actionRow := window addARowCentered: {
		buttons first. 
		(Morph new extent: 30@5) color: Color transparent. 
		buttons second
	} cellInset: 2.
	window
		addARow: {
				(window inAColumn: {(pane2a := window inARow: {window inAColumn: {treePane}}) 
					useRoundedCorners;
					layoutInset: 0;
					borderWidth: 1;
					borderColor: (Color r: 0.6 g: 0.7 b: 1)
				}) layoutInset: 10.
				(window inAColumn: {(pane2b := window inARow: {window inAColumn: {fileListPane}}) 
					useRoundedCorners;
					layoutInset: 0;
					borderWidth: 1;
					borderColor: (Color r: 0.6 g: 0.7 b: 1)
				}) layoutInset: 10.
		}.
	window fullBounds.
	window fillWithRamp: (Color r: 1 g: 0.85 b: 0.975) oriented: 0.65.
	pane2a fillWithRamp: (Color r: 0.85 g: 0.9 b: 1) oriented: (0.7 @ 0.35).
	pane2b fillWithRamp: (Color r: 0.85 g: 0.9 b: 1) oriented: (0.7 @ 0.35).
"
	buttons do: [ :each |
		each fillWithRamp: ColorTheme current dialogButtonsRampOrColor oriented: (0.75 @ 0).
	].
"
	fileTypeButtons do: [ :each | 
		each 
			on: #mouseUp 
			send: #value:value: 
			to: [ :evt :morph | 
				self update: actionRow in: window fileTypeRow: fileTypeRow morphUp: morph.
			]
	].
	buttons first on: #mouseUp send: #okHit to: aFileList.
	buttons second on: #mouseUp send: #cancelHit to: aFileList.
	aFileList postOpen.
	window position: aWorld topLeft + (aWorld extent - window extent // 2).
	aFileList directoryChangeBlock: [ :newDir |
		self update: actionRow in: window fileTypeRow: fileTypeRow morphUp: nil.
		self enableTypeButtons: fileTypeButtons info: fileTypeInfo forDir: newDir.
	].
	aFileList directory: aFileList directory.
	window adoptPaneColor: (Color r: 0.548 g: 0.677 b: 1.0).
	^ window openInWorld: aWorld.