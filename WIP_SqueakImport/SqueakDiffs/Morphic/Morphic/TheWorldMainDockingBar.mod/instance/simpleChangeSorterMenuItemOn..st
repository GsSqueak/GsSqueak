submenu - tools
simpleChangeSorterMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Simple Change Sorter' translated;
			help: 'Open a Change Sorter' translated;
			icon: (self colorIcon: ChangeSorter basicNew windowColorToUse);
			target: ChangeSorter;
			selector: #open ]