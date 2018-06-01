menus
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	running
		ifTrue: [aCustomMenu add: 'stop' translated action: #stopRunning]
		ifFalse: [aCustomMenu add: 'start' translated action: #startRunning]