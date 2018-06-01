menus
addToggleItemsToHaloMenu: aCustomMenu 
	"Add toggle-items to the halo menu"
	super addToggleItemsToHaloMenu: aCustomMenu.
	Preferences noviceMode
		ifFalse: [""aCustomMenu
				addUpdating: #useInterpolationString
				target: self
				action: #toggleInterpolation]