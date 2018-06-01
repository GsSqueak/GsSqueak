submenu - tools
methodFinderMenuItemOn: menu 

	menu addItem: [:item | 
		item 
			contents: 'Method Finder' translated;
			help: 'Open the Method Finder' translated;
			icon: (self colorIcon: SelectorBrowser basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openSelectorBrowser]