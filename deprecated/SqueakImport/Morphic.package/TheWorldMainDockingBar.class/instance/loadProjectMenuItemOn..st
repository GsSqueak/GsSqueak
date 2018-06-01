submenu - projects
loadProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Load Project' translated;
			help: 'Load a project from a file' translated;
			target: self;
			selector: #loadProject ]