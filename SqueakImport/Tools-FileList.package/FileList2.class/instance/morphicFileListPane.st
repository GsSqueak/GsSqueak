user interface
morphicFileListPane

	^(PluggableListMorph 
		on: self 
		list: #fileList 
		selected: #fileListIndex
		changeSelected: #fileListIndex: 
		menu: #fileListMenu:)
			enableDrag: true;
			enableDrop: false;
			yourself

