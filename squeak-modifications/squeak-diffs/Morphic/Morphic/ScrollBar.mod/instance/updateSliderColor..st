updating
updateSliderColor: aColor

	self class gradientScrollBar
		ifFalse: [self updateSliderColorSolid: aColor]
		ifTrue: [self updateSliderColorGradient: aColor].
		
	self flag: #performance. "mt: This is slow..."
	self updateMenuButtonImage.
	self updateUpButtonImage.
	self updateDownButtonImage.