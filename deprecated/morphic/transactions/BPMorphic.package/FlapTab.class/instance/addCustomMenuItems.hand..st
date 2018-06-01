menu
addCustomMenuItems: aMenu hand: aHandMorph 
	"Add further items to the menu as appropriate"
	aMenu
		add: 'tab color...' translated
		target: self
		action: #changeColor.
	aMenu
		add: 'flap color...' translated
		target: self
		action: #changeFlapColor.
	aMenu addLine.
	aMenu addUpdating: #edgeString action: #setEdgeToAdhereTo.
	aMenu addLine.
	aMenu addUpdating: #textualTabString action: #textualTab.
	aMenu addUpdating: #graphicalTabString action: #graphicalTab.
	aMenu
		addUpdating: #solidTabString
		enablement: #notSolid
		action: #solidTab.
	aMenu addLine.
	(referent isKindOf: PasteUpMorph)
		ifTrue: [aMenu addUpdating: #partsBinString action: #togglePartsBinMode].
	aMenu addUpdating: #dragoverString action: #toggleDragOverBehavior.
	aMenu addUpdating: #mouseoverString action: #toggleMouseOverBehavior.
	aMenu addLine.
	aMenu
		addUpdating: #isGlobalFlapString
		enablement: #sharedFlapsAllowed
		action: #toggleIsGlobalFlap.
	aMenu balloonTextForLastItem: 'If checked, this flap will be available in all morphic projects; if not, it will be private to this project.' translated.
	aMenu addLine.
	aMenu
		addUpdating: #compactFlapString
		target: self
		action: #changeCompactFlap.
	aMenu add: 'destroy this flap' translated action: #destroyFlap