menu
addModelMenuItemsTo: aCustomMenu forMorph: aMorph hand: aHandMorph
	aCustomMenu addLine.
	aCustomMenu add: 'whose script is this?' translated target: self action: #identifyScript
	