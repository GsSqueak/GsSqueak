menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add morph-specific items to the menu for the hand"

	| sketch |
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	self isCurrentlyTextual
		ifTrue:
			[aCustomMenu add: 'change label wording...' translated action: #changeTabText.
			aCustomMenu add: 'use graphical label' translated action: #useGraphicalTab]
		ifFalse:
			[aCustomMenu add: 'use textual label' translated action: #useTextualTab.
			aCustomMenu add: 'choose graphic...' translated action: #changeTabGraphic.
			(sketch := self findA: SketchMorph) ifNotNil:
				[aCustomMenu add: 'repaint' translated target: sketch action: #editDrawing]]