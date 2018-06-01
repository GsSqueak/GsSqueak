menus
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'edit contents...' translated action: #edit.
	aCustomMenu add: 'how to find more fonts...' translated action: #howTo.
	aCustomMenu add: 'load font from web...' translated action: #loadFromURL.