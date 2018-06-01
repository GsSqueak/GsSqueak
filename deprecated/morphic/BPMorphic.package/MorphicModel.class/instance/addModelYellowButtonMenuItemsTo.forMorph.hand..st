graph model
addModelYellowButtonMenuItemsTo: aCustomMenu forMorph: aMorph hand: aHandMorph 
	Preferences noviceMode
		ifFalse: [super
				addModelYellowButtonMenuItemsTo: aCustomMenu
				forMorph: aMorph
				hand: aHandMorph].
	^ aCustomMenu