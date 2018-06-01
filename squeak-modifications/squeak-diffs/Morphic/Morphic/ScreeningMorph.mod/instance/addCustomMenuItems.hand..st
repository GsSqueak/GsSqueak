menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	submorphs isEmpty ifTrue:
		[^ aCustomMenu add: '*Please add a source morph*' translated action: #itself].
	submorphs size = 1 ifTrue:
		[^ aCustomMenu add: '*Please add a screen morph*' translated action: #itself].
	submorphs size > 2 ifTrue:
		[^ aCustomMenu add: '*I have too many submorphs*' translated action: #itself].
	aCustomMenu add: 'show screen only' translated action: #showScreenOnly.
	aCustomMenu add: 'show source only' translated action: #showSourceOnly.
	aCustomMenu add: 'show screen over source' translated action: #showScreenOverSource.
	aCustomMenu add: 'show source screened' translated action: #showScreened.
	aCustomMenu add: 'exchange source and screen' translated action: #exchange.
	displayMode == #showScreenOnly ifTrue:
		[aCustomMenu add: 'choose passing color' translated action: #choosePassingColor.
		aCustomMenu add: 'choose blocking color' translated action: #chooseBlockingColor].
