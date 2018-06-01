submenu - projects
saveProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save Project' translated;
			help: 'Save this project on a file' translated;
			target: Project current world;
			selector: #saveOnFile ]