toolbuilder
buildDirectoryTreeWith: builder 
	| treeSpec |
	treeSpec := builder pluggableTreeSpec new.
	treeSpec
		 model: self ;
		 roots: #rootDirectoryList ;
		 hasChildren: #hasMoreDirectories: ;
		 getChildren: #subDirectoriesOf: ;
		 getSelectedPath: #selectedPath ;
		 setSelected: #setDirectoryTo: ;
		 getSelected: #directory;
		 label: #directoryNameOf: ;
		 menu: #volumeMenu: ;
		 autoDeselect: false.
	SystemBrowser browseWithDragNDrop ifTrue:
		[ treeSpec
			dragItem: #dragFromDirectoryList: ;
			dropItem: #drop:ontoDirectory:shouldCopy: ;
			dropAccept: #wantsDraggedObject: ].
	^ treeSpec