misc
addModelItemsToWindowMenu: aMenu
	"Add model-related item to the window menu"

	super addModelItemsToWindowMenu: aMenu. 
	Smalltalk isMorphic ifTrue:
		[aMenu addLine.
		aMenu add: 'what to show...' translated target: self action: #offerWhatToShowMenu]