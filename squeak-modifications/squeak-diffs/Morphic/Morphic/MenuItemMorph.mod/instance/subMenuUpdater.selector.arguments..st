accessing
subMenuUpdater: updater selector: selector arguments: arguments

	subMenu := self createUpdatingSubmenu.
	subMenu updater: updater updateSelector: selector arguments: arguments.
	self changed.
