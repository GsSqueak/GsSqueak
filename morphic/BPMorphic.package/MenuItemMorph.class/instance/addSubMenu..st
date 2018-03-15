accessing
addSubMenu: aBlock 
	subMenu := self createSubmenu.
	aBlock value: subMenu.
	self changed