menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addList: {
		{'progress color...' translated. #changeProgressColor:}.
		{'progress value...' translated. #changeProgressValue:}.
		}