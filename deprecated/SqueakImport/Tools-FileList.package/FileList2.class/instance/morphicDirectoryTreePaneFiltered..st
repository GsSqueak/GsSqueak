user interface
morphicDirectoryTreePaneFiltered: aSymbol
	^(SimpleHierarchicalListMorph 
		on: self
		list: aSymbol
		selected: #currentDirectorySelected
		changeSelected: #setSelectedDirectoryTo:
		menu: #volumeMenu:
		keystroke: nil)
			autoDeselect: false;
			enableDrag: false;
			enableDrop: true;
			yourself
		
