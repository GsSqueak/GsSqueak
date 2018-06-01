geometry
expandSlider
	"Compute the new size of the slider (use the old sliderThickness as a
	minimum). "
	| _gsSqueakTemp_r |
	_gsSqueakTemp_r := self totalSliderArea.
	slider
		extent: (self orientation == #horizontal
				ifTrue: [(((_gsSqueakTemp_r width * self interval) asInteger max: self minThumbThickness)
						min: _gsSqueakTemp_r width)
						@ slider height]
				ifFalse: [slider width
						@ (((_gsSqueakTemp_r height * self interval) asInteger max: self minThumbThickness)
								min: _gsSqueakTemp_r height)])