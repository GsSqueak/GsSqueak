accessing
subMenuUpdater: updater selector: _selector 
	subMenu := self createUpdatingSubmenu.
	subMenu updater: updater updateSelector: _selector.
	self changed