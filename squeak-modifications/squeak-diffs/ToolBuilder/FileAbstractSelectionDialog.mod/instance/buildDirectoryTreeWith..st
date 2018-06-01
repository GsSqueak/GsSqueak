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
		 menu: nil ;
		 autoDeselect: false.
	^ treeSpec