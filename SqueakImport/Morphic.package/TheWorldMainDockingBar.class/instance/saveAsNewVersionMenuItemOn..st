submenu - squeak
saveAsNewVersionMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save As New Version' translated;
			help: 'Save the current state of Squeak on disk under a version-stamped name' translated;
			target: self;
			selector: #saveAsNewVersion ]