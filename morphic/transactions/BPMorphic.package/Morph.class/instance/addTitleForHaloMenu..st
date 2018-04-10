menu
addTitleForHaloMenu: aMenu 
	aMenu
		addTitle: self externalName
		icon: (self
				iconOrThumbnailOfSize: (Preferences tinyDisplay
						ifTrue: [16]
						ifFalse: [28]))