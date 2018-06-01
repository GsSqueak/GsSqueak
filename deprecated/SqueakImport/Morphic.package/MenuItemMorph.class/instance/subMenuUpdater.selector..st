accessing
subMenuUpdater: updater selector: selector

	subMenu := self createUpdatingSubmenu.
	subMenu updater: updater updateSelector: selector.
	self changed.
