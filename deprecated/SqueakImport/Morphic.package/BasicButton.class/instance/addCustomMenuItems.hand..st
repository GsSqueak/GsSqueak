menus
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'change label...' translated action: #setLabel