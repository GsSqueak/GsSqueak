toolbuilder
buildDirectoryTreeWith: builder 
	| _gsSqueakTemp_treeSpec |
	_gsSqueakTemp_treeSpec := builder pluggableTreeSpec new.
	_gsSqueakTemp_treeSpec model: self;
		 roots: #rootDirectoryList;
		 hasChildren: #hasMoreDirectories:;
		 getChildren: #subDirectoriesOf:;
		 getSelectedPath: #selectedPath;
		 setSelected: #setDirectoryTo:;
		 getSelected: #directory;
		 label: #directoryNameOf:;
		 menu: #volumeMenu:;
		 autoDeselect: false.
	SystemBrowser browseWithDragNDrop
		ifTrue: [_gsSqueakTemp_treeSpec dragItem: #dragFromDirectoryList:;
				 dropItem: #drop:ontoDirectory:shouldCopy:;
				 dropAccept: #wantsDraggedObject:].
	^ _gsSqueakTemp_treeSpec