volume menu
servicesVolumeMenu: aMenu
	<volumeMenu>
	aMenu
		addServices: (self itemsForDirectory: self directory)
		for: self
		extraLines: #().
	^aMenu.