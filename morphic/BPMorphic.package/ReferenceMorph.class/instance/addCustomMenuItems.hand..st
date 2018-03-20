menu
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	"Add morph-specific items to the menu for the hand"
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	self isCurrentlyTextual
		ifTrue: [aCustomMenu add: 'change label wording...' translated action: #changeTabText.
			aCustomMenu add: 'use graphical label' translated action: #useGraphicalTab]
		ifFalse: [aCustomMenu add: 'use textual label' translated action: #useTextualTab.
			aCustomMenu add: 'choose graphic...' translated action: #changeTabGraphic.
			(self findA: SketchMorph)
				ifNotNil: [:_gsSqueakTemp_sketch | aCustomMenu
						add: 'repaint' translated
						target: _gsSqueakTemp_sketch
						action: #editDrawing]]