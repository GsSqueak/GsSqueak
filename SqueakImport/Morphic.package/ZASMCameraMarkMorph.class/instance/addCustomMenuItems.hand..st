menu
addCustomMenuItems: aMenu hand: aHandMorph
	"Add custom halo menu items"

	aMenu add: 'Go to this mark' translated target: self action: #gotoMark.
	aMenu add: 'Set transition' translated target: self action: #setTransition.

	super addCustomMenuItems: aMenu hand: aHandMorph
