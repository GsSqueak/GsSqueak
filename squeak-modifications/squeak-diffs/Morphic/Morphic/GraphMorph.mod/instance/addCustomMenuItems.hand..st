sound
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'open wave editor' translated action: #openWaveEditor.
	aCustomMenu add: 'read file' translated action: #readDataFromFile.
