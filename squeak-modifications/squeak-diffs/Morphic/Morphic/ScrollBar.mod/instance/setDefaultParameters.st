initialize
setDefaultParameters

	"Compared to generic sliders, I am not my own paging area. Thus, make me transparent."
	self
		color: Color transparent;
		borderWidth: 0.

	pagingArea
		color: (self userInterfaceTheme color ifNil: [Color veryVeryLightGray darker alpha: 0.35]);
		borderWidth: 0. "no border for the paging area"

	slider
		color: (self userInterfaceTheme thumbColor ifNil: [Color veryVeryLightGray]);
		borderColor: (self userInterfaceTheme thumbBorderColor ifNil: [Color gray: 0.6]);
		borderWidth: (self userInterfaceTheme thumbBorderWidth ifNil: [1]).
	
	self updateSliderCornerStyle.
	
	sliderShadow
		cornerStyle: slider cornerStyle;
		borderWidth: slider borderWidth;
		borderColor: Color transparent.
	
	sliderColor := slider color.
	self updateSliderColor: slider color.