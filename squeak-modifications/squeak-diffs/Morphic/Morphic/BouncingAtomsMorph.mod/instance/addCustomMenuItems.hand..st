menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'startInfection' translated action: #startInfection.
	aCustomMenu add: 'set atom count' translated action: #setAtomCount.
	aCustomMenu add: 'show infection history' translated action: #showInfectionHistory:.
