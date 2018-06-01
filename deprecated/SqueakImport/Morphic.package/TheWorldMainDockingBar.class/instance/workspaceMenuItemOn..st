submenu - tools
workspaceMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Workspace' translated;
			help: 'Open a Workspace' translated;
			icon: (self colorIcon: Workspace basicNew windowColorToUse);
			target: StandardToolSet;
			selector: #openWorkspace ]