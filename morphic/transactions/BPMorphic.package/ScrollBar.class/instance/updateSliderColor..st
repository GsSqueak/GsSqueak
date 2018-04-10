updating
updateSliderColor: aColor 
	self class gradientScrollBar
		ifTrue: [self updateSliderColorGradient: aColor]
		ifFalse: [self updateSliderColorSolid: aColor].
	self flag: #performance.
	"mt: This is slow..."
	self updateMenuButtonImage.
	self updateUpButtonImage.
	self updateDownButtonImage