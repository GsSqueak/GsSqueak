menus
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'reveal original morph' translated action: #revealOriginal.
	aCustomMenu add: 'grab original morph' translated action: #grabOriginal.
