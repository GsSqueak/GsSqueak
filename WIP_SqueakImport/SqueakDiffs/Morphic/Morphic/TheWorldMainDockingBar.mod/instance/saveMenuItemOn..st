submenu - squeak
saveMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save' translated;
			help: 'Save the current state of Squeak on disk' translated;
			icon: MenuIcons smallSaveIcon;
			target: self;
			selector: #saveImage ]