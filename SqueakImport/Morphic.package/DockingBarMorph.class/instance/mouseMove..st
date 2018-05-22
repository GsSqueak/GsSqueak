events-processing
mouseMove: evt
	"We might transfer control to *either* the currently active submenu or the pop up owner, if any. Since the active sub menu is always displayed upfront check it first."
	
	selectedItem ifNotNil:[selectedItem activateSubmenu: evt].