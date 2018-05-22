submenu - projects
previousProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Previous Project' translated;
			help: 'Return to the most-recently-visited project' translated;
			target: Project current world;
			selector: #goBack ]