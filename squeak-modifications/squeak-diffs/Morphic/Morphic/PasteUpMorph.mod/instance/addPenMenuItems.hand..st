menu & halo
addPenMenuItems: menu hand: aHandMorph
	"Add a pen-trails-within submenu to the given menu"

	menu add: 'pen trails...' translated target: self selector: #putUpPenTrailsSubmenu.
	menu balloonTextForLastItem: 'its governing pen trails drawn within' translated