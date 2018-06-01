accessing
sliderColor: aColor 
	"Change the color of the scrollbar to go with aColor."
	super sliderColor: aColor.
	self updateSliderColor: aColor