blue ui
morphicViewProjectLoader2InWorld: aWorld reallyLoad: aBoolean dirFilterType: aSymbol

	| window aFileList buttons treePane textColor1 fileListPane pane2a pane2b treeExtent filesExtent |

	window := AlignmentMorphBob1 newColumn.
	window hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	textColor1 := Color r: 0.742 g: 0.839 b: 1.0.
	aFileList := self new.
	aFileList 
		optionalButtonSpecs: aFileList servicesForProjectLoader;
		fileSelectionBlock: (
			aSymbol == #limitedSuperSwikiDirectoryList ifTrue: [
				MessageSend receiver: self selector: #projectOnlySelectionMethod:
			] ifFalse: [
				self projectOnlySelectionBlock
			]
		);
		"dirSelectionBlock: self hideSqueakletDirectoryBlock;"
		modalView: window.
	aFileList directory: FileDirectory default.
	window
		setProperty: #FileList toValue: aFileList;
		wrapCentering: #center; cellPositioning: #topCenter;
		borderWidth: 1;
		borderColor: (Color r: 0.9 g: 0.801 b: 0.2);
		useRoundedCorners.
	buttons := {{'OK'. Color lightGreen}. {'Cancel'. Color lightRed}} collect: [ :each |
		self blueButtonText: each first textColor: textColor1 color: each second inWindow: window
	].

	aWorld width < 800 ifTrue: [
		treeExtent := 150@300.
		filesExtent := 350@300.
	] ifFalse: [
		treeExtent := 350@500.
		filesExtent := 550@500.
	].
	(treePane := aFileList morphicDirectoryTreePaneFiltered: aSymbol)
		extent: treeExtent; 
		retractable: false;
		borderWidth: 0.
	fileListPane := aFileList morphicFileListPane 
		extent: filesExtent; 
		retractable: false;
		borderWidth: 0.
	window
		addARow: {
			window fancyText: 'Load A Project' translated font: Preferences standardEToysTitleFont color: textColor1
		};
		addARowCentered: {
			buttons first. 
			(Morph new extent: 30@5) color: Color transparent. 
			buttons second
		};
		addARow: {
			window fancyText: 'Please select a project' translated  font: Preferences standardEToysFont color: textColor1
		};
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
	buttons first 
		on: #mouseUp 
		send: (aBoolean ifTrue: [#okHitForProjectLoader] ifFalse: [#okHit])
		to: aFileList.
	buttons second on: #mouseUp send: #cancelHit to: aFileList.
	aFileList postOpen.
	window position: aWorld topLeft + (aWorld extent - window extent // 2).
	window adoptPaneColor: (Color r: 0.548 g: 0.677 b: 1.0).
	^ window openInWorld: aWorld.