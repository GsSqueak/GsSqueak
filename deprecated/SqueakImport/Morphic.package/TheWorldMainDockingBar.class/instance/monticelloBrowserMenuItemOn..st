submenu - tools
monticelloBrowserMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Monticello Browser' translated;
			help: 'Open a Monticello Browser' translated;
			icon: (self colorIcon: MCTool basicNew windowColorToUse);
			target: MCWorkingCopyBrowser;
			selector: #open ]