event handling
mouseDownInSlider: event

	"make the entire scrollable area visible if a full scrollbar is clicked on"
	self interval = self maximumValue ifTrue: [
		self setValue: 0.
		self model hideOrShowScrollBars].
	
	self showSliderShadow.