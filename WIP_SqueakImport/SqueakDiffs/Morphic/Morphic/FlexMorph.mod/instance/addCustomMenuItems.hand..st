menus
addCustomMenuItems: aCustomMenu hand: aHandMorph

	"super addCustomMenuItems: aCustomMenu hand: aHandMorph."
	aCustomMenu addLine.
	aCustomMenu add: 'update from original' translated action: #updateFromOriginal.
	aCustomMenu addList: {
						{'border color...' translated. #changeBorderColor:}.
						{'border width...' translated. #changeBorderWidth:}.
						}.
	aCustomMenu addLine.
