menu
addTargetingMenuItems: aCustomMenu hand: aHandMorph 
	"Add targeting menu items"
	aCustomMenu addLine.

	aCustomMenu add: 'set target' translated action: #targetWith:.
	aCustomMenu add: 'sight target' translated action: #sightTargets:.
	target
		ifNotNil: [aCustomMenu add: 'clear target' translated action: #clearTarget]