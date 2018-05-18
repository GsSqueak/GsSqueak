control
activeSubmenu: aSubmenu 
	activeSubMenu isNil
		ifFalse: [activeSubMenu delete].
	activeSubMenu := aSubmenu.
	aSubmenu isNil
		ifTrue: [^ self].
	activeSubMenu updateMenu.
	activeSubMenu selectItem: nil event: nil.
	MenuIcons decorateMenu: activeSubMenu.
	activeSubMenu 
		activatedFromDockingBar: self;
		beSticky;
		resistsRemoval: true;
		removeMatchString