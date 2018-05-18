geometry
expandSlider
	"Compute the new size of the slider (use the old sliderThickness as a minimum)."
	| r |
	r := self totalSliderArea.
	slider extent: (self orientation == #horizontal
		ifTrue: [(((r width * self interval) asInteger max: self minThumbThickness) min: r width) @ slider height]
		ifFalse: [slider width @ (((r height * self interval) asInteger max: self minThumbThickness) min: r height)])