toolbuilder
buildFileListWith: builder 
	| buttons listSpec top |
	top := builder pluggablePanelSpec new.
	top children: OrderedCollection new.
	buttons := self buildButtonPaneWith: builder.
	buttons frame:
		(self
			topConstantHeightFrame: self buttonHeight
			fromLeft: 0
			width: 1).
	top children add: buttons.
	listSpec := builder pluggableListSpec new.
	listSpec
		 model: self ;
		 list: #fileList ;
		 getIndex: #fileListIndex ;
		 setIndex: #fileListIndex: ;
		 menu: #fileListMenu: ;
		 keyPress: nil ;
		 frame:
		(self
			frameOffsetFromTop: self buttonHeight * 1.1
			fromLeft: 0
			width: 1
			bottomFraction: 1) .
	SystemBrowser browseWithDragNDrop ifTrue: [ listSpec dragItem: #dragFromFileList: ].
	top children add: listSpec.
	^ top