submenu - squeak
saveAndQuitMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save And Quit' translated;
			help: 'Save the current state of Squeak on disk, and quit out of Squeak' translated;
			target: self;
			selector: #saveAndQuitSqueak ]