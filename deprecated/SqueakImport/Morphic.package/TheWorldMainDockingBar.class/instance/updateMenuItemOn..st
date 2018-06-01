submenu - squeak
updateMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Update Squeak' translated;
			help: 'Load latest code updates via the internet' translated;
			icon: MenuIcons smallChangesIcon;
			target: self;
			selector: #updateSqueak ]