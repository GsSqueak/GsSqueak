menus
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	aCustomMenu add: 'make a flex morph' translated selector: #makeFlexMorphFor: argument: aHandMorph.
	flipOnClick
		ifTrue: [aCustomMenu add: 'disable bookmark action' translated action: #toggleBookmark]
		ifFalse: [aCustomMenu add: 'enable bookmark action' translated action: #toggleBookmark].
	(bookMorph isKindOf: BookMorph)
		ifTrue:
			[aCustomMenu add: 'set page sound' translated action: #setPageSound:.
			aCustomMenu add: 'set page visual' translated action: #setPageVisual:]
