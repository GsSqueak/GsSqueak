code pane menu
addToggleStylingMenuItemTo: aMenu
	
	aMenu
		addUpdating: #toggleStylingLabel
		target: self
		action: #toggleStyling