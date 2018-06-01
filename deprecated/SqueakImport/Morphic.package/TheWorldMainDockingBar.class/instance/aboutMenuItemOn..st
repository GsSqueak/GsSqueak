submenu - squeak
aboutMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'About Squeak...' translated;
			target: self;
			selector: #aboutSqueak ]