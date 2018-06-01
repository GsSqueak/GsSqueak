other
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	"super addCustomMenuItems: aCustomMenu hand: aHandMorph."
	"don't want the ones from ImageMorph"
	aCustomMenu add: 'grab stamp from screen' translated action: #grabFromScreen: