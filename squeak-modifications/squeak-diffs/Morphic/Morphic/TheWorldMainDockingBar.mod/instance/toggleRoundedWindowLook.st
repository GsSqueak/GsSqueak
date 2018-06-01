submenu - extras
toggleRoundedWindowLook

	| switch |
	switch := SystemWindow roundedWindowCorners not.
	
	SystemWindow roundedWindowCorners: switch.
	DialogWindow roundedDialogCorners: switch.
	MenuMorph roundedMenuCorners: switch.