menus
addCustomMenuItems: menu hand: aHandMorph

	super addCustomMenuItems: menu hand: aHandMorph.

	self worldIEnclose
		addScalingMenuItems: menu 
		hand: aHandMorph
