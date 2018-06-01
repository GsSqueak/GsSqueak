submenu - tools
browserMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Browser' translated;
			help: 'Open a browser' translated;
			icon: (self colorIcon: Browser basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openClassBrowser ]