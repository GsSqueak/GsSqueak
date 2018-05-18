menu
addTitleForHaloMenu: aMenu 
	aMenu
		addTitle: self externalName
		icon: (self iconOrThumbnailOfSize: (Preferences tinyDisplay ifFalse:[28] ifTrue:[16]))