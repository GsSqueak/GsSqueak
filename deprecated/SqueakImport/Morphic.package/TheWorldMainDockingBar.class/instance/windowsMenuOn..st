construction
windowsMenuOn: aDockingBar

	aDockingBar addItem: [ :item |
		item
			contents: 'Windows' translated;
			subMenuUpdater: self
			selector: #listWindowsOn: ]
