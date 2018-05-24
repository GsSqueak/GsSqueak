submenu - squeak
saveAsMenuItemOn: menu

	menu addItem: [ :item |	
		item
			contents: 'Save As...' translated;
			help: 'Save the current state of Squeak on disk under a new name' translated;
			target: self;
			selector: #saveImageAs ]