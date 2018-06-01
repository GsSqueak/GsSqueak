other events
mouseUpInSlider: event 
	slider borderStyle style == #inset
		ifTrue: [slider borderColor: #raised].
	self hideSliderShadow