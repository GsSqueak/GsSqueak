submenu - projects
updateNewProjectSubMenu: menu

	Project allSubclasses do: [ :each |
		menu addItem: [ :item | 
			item
				contents: ('New ', each name) translated;
				help: ('Start a new ', each name) translated;
				target: self;
				selector: #newProject:;
				arguments: { each } ] ]