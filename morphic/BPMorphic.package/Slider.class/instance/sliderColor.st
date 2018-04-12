accessing - ui
sliderColor
	"color scheme for the whole slider widget"
	^ sliderColor
		ifNil: [self userInterfaceTheme thumbColor
				ifNil: [Color veryVeryLightGray]]