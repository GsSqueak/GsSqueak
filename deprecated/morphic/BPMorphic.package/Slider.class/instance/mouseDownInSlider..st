other events
mouseDownInSlider: event 
	slider borderStyle style == #raised
		ifTrue: [slider borderColor: #inset].
	self showSliderShadow