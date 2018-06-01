menus
addCustomMenuItems: aMenu hand: aHandMorph

	"Add further items to the menu as appropriate"

	super addCustomMenuItems: aMenu hand: aHandMorph.
	aMenu 
		addUpdating: #orientationString 
		action: #toggleOrientation.
