control
activeSubmenu: aSubmenu 
	activeSubMenu
		ifNotNil: [activeSubMenu delete].
	activeSubMenu := aSubmenu.
	activeSubMenu
		ifNotNil: [activeSubMenu updateMenu]