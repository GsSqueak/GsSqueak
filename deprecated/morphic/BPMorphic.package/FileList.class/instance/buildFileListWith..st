toolbuilder
buildFileListWith: builder 
	| _gsSqueakTemp_buttons _gsSqueakTemp_listSpec _gsSqueakTemp_top |
	_gsSqueakTemp_top := builder pluggablePanelSpec new.
	_gsSqueakTemp_top children: OrderedCollection new.
	_gsSqueakTemp_buttons := self buildButtonPaneWith: builder.
	_gsSqueakTemp_buttons
		frame: (self
				topConstantHeightFrame: self buttonHeight
				fromLeft: 0
				width: 1).
	_gsSqueakTemp_top children add: _gsSqueakTemp_buttons.
	_gsSqueakTemp_listSpec := builder pluggableListSpec new.
	_gsSqueakTemp_listSpec model: self;
		 list: #fileList;
		 getIndex: #fileListIndex;
		 setIndex: #fileListIndex:;
		 menu: #fileListMenu:;
		 keyPress: nil;
		
		frame: (self
				frameOffsetFromTop: self buttonHeight * 1.1
				fromLeft: 0
				width: 1
				bottomFraction: 1).
	SystemBrowser browseWithDragNDrop
		ifTrue: [_gsSqueakTemp_listSpec dragItem: #dragFromFileList:].
	_gsSqueakTemp_top children add: _gsSqueakTemp_listSpec.
	^ _gsSqueakTemp_top