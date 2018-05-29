menus
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	aCustomMenu add: 'change tilt and zoom keys' translated action: #changeKeys.
	aCustomMenu add: 'run an existing camera script' translated action: #runAScript.
	aCustomMenu add: 'edit an existing camera script' translated action: #editAScript.

