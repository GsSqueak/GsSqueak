submenu - extras
toggleRoundedButtonLook

	| switch |
	switch := PluggableButtonMorph roundedButtonCorners not.
	
	PluggableButtonMorph roundedButtonCorners: switch.
	ScrollBar roundedScrollBarLook: switch.