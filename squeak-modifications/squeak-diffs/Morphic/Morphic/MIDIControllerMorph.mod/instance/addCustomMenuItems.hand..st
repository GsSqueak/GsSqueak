menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'set channel' translated action: #setChannel:.
	aCustomMenu add: 'set controller' translated action: #setController:.
