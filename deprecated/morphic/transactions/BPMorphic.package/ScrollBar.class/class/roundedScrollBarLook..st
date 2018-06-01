preferences
roundedScrollBarLook: aBoolean 
	RoundedScrollBarLook = aBoolean
		ifTrue: [^ self].
	RoundedScrollBarLook := aBoolean.
	ScrollBar
		allSubInstancesDo: [:ea | ea updateSliderCornerStyle]