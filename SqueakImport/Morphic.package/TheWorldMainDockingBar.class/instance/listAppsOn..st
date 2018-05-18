submenu - apps
listAppsOn: menu
	"Update the apps list in the menu"

	| args |
	TheWorldMenu registeredOpenCommands do:[:spec|
		args := spec second.
		menu addItem: [ :item |
			item
				contents: spec first translated;
				target: args first;
				selector: args second].
	].
