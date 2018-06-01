updating
updateSlider
	"Updates layout properties of the slider."
	slider bounds: self totalSliderArea.
	sliderShadow bounds: slider bounds.
	self computeSlider