updating
updateColorsForBalloonOwner
	
	self color: self balloonOwner balloonColor.
	
	"If the balloon owner has a custom balloon color, derive the balloon border color from it."
	self flag: #refactor. "mt: Add #balloonBorderColor *width etc. to Morph."
	(self balloonOwner hasProperty: #balloonColor)
		ifTrue: [self borderColor: (self color adjustBrightness: -0.2)].