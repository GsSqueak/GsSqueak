submenu - projects
newProjectMenuItemOn: menu

	menu addItem: [ :item | 
		item
			contents: 'New Project' translated;
			help: 'Start a new MorphicProject' translated;
			icon: MenuIcons smallProjectIcon;
			target: self;
			selector: #newProject:;
			arguments: { MorphicProject };
			subMenuUpdater:  self
			selector: #updateNewProjectSubMenu: ]