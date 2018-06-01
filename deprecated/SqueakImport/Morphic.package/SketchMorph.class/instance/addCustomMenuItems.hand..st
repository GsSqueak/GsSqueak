menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add custom menu items"

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'restore base graphic' translated target: self action: #restoreBaseGraphicFromMenu.
	aCustomMenu add: 'call this my base graphic' translated target: self action: #callThisBaseGraphic.
	aCustomMenu add: 'choose new graphic...' translated target: self action: #chooseNewGraphic.
	aCustomMenu addLine.
	aCustomMenu add: 'set as background' translated target: rotatedForm action: #setAsBackground.
	self addPaintingItemsTo: aCustomMenu hand: aHandMorph