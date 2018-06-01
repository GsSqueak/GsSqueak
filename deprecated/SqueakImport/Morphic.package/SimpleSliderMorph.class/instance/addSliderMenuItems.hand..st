menu
addSliderMenuItems: aCustomMenu hand: aHandMorph 
	"Add items to set slider parameters"
	aCustomMenu addLine.
	""
	aCustomMenu add: 'set action selector' translated action: #setActionSelector.
	aCustomMenu add: 'change arguments' translated action: #setArguments.
	""
	aCustomMenu add: 'set minimum value' translated action: #setMinVal.
	aCustomMenu add: 'set maximum value' translated action: #setMaxVal.
	""
	aCustomMenu addUpdating: #descendingString action: #toggleDescending.
	aCustomMenu addUpdating: #truncateString action: #toggleTruncate.
	