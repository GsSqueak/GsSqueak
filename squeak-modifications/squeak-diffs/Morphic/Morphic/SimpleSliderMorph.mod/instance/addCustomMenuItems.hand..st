menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"To all the other Custom menu items add slider and targeting items."
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	self addSliderMenuItems: aCustomMenu hand: aHandMorph .
	self addTargetingMenuItems: aCustomMenu hand: aHandMorph .