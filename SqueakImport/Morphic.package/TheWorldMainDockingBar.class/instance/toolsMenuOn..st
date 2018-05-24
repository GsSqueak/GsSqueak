construction
toolsMenuOn: aDockingBar 

	aDockingBar addItem: [ :item |
		item
			contents: 'Tools' translated;
			addSubMenu: [ :menu | 
				self
					browserMenuItemOn: menu;
					workspaceMenuItemOn: menu;
					transcriptMenuItemOn: menu;
					testRunnerMenuItemOn: menu;
					methodFinderMenuItemOn: menu.
				menu addLine.
				self 
					monticelloBrowserMenuItemOn: menu;
					monticelloConfigurationsMenuItemOn: menu;
					simpleChangeSorterMenuItemOn: menu;
					dualChangeSorterMenuItemOn: menu.
				menu addLine.
				self
					processBrowserMenuItemOn: menu;
					preferenceBrowserMenuItemOn: menu;
					fileListMenuItemOn: menu.
			] ]