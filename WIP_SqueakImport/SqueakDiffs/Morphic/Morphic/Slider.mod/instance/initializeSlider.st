initialization
initializeSlider

	slider := RectangleMorph
		newBounds: self totalSliderArea
		color: self thumbColor.
	
	sliderShadow := RectangleMorph
		newBounds: self totalSliderArea
		color: self pagingArea color.
	
	slider on: #mouseMove send: #scrollAbsolute: to: self.
	slider on: #mouseDown send: #mouseDownInSlider: to: self.
	slider on: #mouseUp send: #mouseUpInSlider: to: self.

	self addMorphFront: sliderShadow.
	self addMorphFront: slider.

	self computeSlider.
	self hideSliderShadow.