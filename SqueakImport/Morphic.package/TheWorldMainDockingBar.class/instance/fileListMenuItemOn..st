submenu - tools
fileListMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'File List' translated;
			help: 'Open a file list' translated;
			icon: (self colorIcon: FileList basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openFileList ]