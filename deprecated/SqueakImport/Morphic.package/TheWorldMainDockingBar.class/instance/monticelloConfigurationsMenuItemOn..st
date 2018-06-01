submenu - tools
monticelloConfigurationsMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Monticello Configurations' translated;
			help: 'Open a Monticello Configurations Editor' translated;
			icon: (self colorIcon: MCConfigurationBrowser basicNew windowColorToUse);
			target: MCConfigurationBrowser;
			selector: #open ]