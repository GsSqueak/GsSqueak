submenu - tools
processBrowserMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Process Browser' translated;
			help: 'Open a Process Browser' translated;
			icon: (self colorIcon: ProcessBrowser basicNew windowColorToUse);
			target: ProcessBrowser;
			selector: #open ]