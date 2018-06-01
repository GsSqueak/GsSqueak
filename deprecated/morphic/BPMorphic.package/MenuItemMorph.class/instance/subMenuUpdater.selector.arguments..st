accessing
subMenuUpdater: updater selector: _selector arguments: _arguments 
	subMenu := self createUpdatingSubmenu.
	subMenu
		updater: updater
		updateSelector: _selector
		arguments: _arguments.
	self changed