initialization
updateSlider

	super updateSlider.
	
	slider horizontal: self orientation == #horizontal.
	sliderShadow horizontal: self orientation == #horizontal.