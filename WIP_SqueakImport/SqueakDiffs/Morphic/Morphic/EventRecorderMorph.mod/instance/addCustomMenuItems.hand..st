initialization
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'add voice controls' translated action: #addVoiceControls.
	aCustomMenu add: 'add journal file' translated action: #addJournalFile.
