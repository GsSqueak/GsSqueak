menu
addCustomMenuItems: aMenu hand: aHandMorph
	"Add further items to the menu as appropriate.  NB: Cannot call super here."

	aMenu add: 'flap color...' translated target: self action: #changeFlapColor.
	aMenu addLine.
	aMenu addUpdating: #edgeString action: #setEdgeToAdhereTo.
	aMenu addUpdating: #dragoverString action: #toggleDragOverBehavior.
	aMenu addUpdating: #mouseoverString action: #toggleMouseOverBehavior.
	aMenu addLine.
	aMenu addUpdating: #compactFlapString target: self action: #changeCompactFlap.

	aMenu add: 'destroy this flap' translated action: #destroyFlap