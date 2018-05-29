misc
addBookMenuItemsTo: aCustomMenu hand: aHandMorph
	(self hasSubmorphWithProperty: #pageControl)
		ifTrue: [aCustomMenu add: 'hide page controls' translated action: #hidePageControls]
		ifFalse: [aCustomMenu add: 'show page controls' translated action: #showPageControls]