accessing
maximumWidth

	^ maximumWidth ifNil: [
		maximumWidth := (self balloonOwner balloonFont widthOf: $m) * Preferences maxBalloonHelpLineLength]