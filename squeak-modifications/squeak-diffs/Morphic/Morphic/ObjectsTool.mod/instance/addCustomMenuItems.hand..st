menu
addCustomMenuItems: aMenu hand: aHand
	"Add items to the given halo-menu, given a hand"

	super addCustomMenuItems: aMenu hand: aHand.
	aMenu addLine.
	aMenu add: 'alphabetic' translated target: self selector: #showAlphabeticTabs.
	aMenu add: 'find' translated target: self selector: #showSearchPane.
	aMenu add: 'categories' translated target: self selector: #showCategories.
	aMenu addLine.
	aMenu add: 'reset thumbnails' translated target: self selector: #resetThumbnails.