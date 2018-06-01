submenu - projects
jumpToProjectMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Jump To Project' translated;
			icon: MenuIcons smallProjectJumpIcon;
			subMenuUpdater: self
			selector: #updateJumpToProjectSubMenu: ]