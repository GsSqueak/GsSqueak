submenu - tools
preferenceBrowserMenuItemOn: menu
	Smalltalk at: #PreferenceBrowser ifPresent:[:pb|
		menu addItem: [ :item |
			item
				contents: 'Preferences' translated;
				help: 'Open a Preferences Browser' translated;
				icon: (self colorIcon: pb basicNew windowColorToUse);
				target: pb;
				selector: #open ]
	].