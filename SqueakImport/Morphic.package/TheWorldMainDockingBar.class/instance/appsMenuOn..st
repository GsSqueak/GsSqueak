submenu - apps
appsMenuOn: aDockingBar
	"Create a menu with the registered apps"

	aDockingBar addItem: [ :item |
		item
			contents: 'Apps' translated;
			subMenuUpdater: self
			selector: #listAppsOn: ]
