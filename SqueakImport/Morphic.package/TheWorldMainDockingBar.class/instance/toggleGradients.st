submenu - extras
toggleGradients

	| switch |
	switch := SystemWindow gradientWindow not.
	
	SystemWindow gradientWindow: switch.
	DialogWindow gradientDialog: switch.
	MenuMorph gradientMenu: switch.
	ScrollBar gradientScrollBar: switch.
	PluggableButtonMorph gradientButton: switch.