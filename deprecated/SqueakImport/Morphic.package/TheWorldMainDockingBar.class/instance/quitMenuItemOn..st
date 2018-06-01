submenu - squeak
quitMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Quit' translated;
			help: 'Quit out of Squeak' translated;
			icon: MenuIcons smallQuitNoSaveIcon;
			target: self;
			selector: #quitSqueak ]