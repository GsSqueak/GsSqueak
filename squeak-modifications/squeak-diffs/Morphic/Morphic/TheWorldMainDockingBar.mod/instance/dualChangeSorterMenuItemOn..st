submenu - tools
dualChangeSorterMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Dual Change Sorter' translated;
			help: 'Open a Dual Change Sorter' translated;
			icon: (self colorIcon: ChangeSorter basicNew windowColorToUse);
			target: DualChangeSorter;
			selector: #open ]