initialization
setDefaultParameters
	"change the receiver's appareance parameters"

	self
		color: (self userInterfaceTheme color ifNil: [Color lightGray]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color gray]);
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]).
	
	slider
		color: (self userInterfaceTheme thumbColor ifNil: [Color veryVeryLightGray]);
		borderColor: (self userInterfaceTheme thumbBorderColor ifNil: [Color gray: 0.6]);
		borderWidth: (self userInterfaceTheme thumbBorderWidth ifNil: [0]).

	sliderShadow
		borderWidth: slider borderWidth;
		borderColor: Color transparent.

	sliderColor := slider color.
	self updateSliderColor: slider color.