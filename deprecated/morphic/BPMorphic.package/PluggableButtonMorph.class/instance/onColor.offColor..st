accessing
onColor: colorWhenOn offColor: colorWhenOff 
	"Set the fill colors to be used when this button is on/off."
	onColor := colorWhenOn.
	offColor := colorWhenOff.
	hoverColor := (self userInterfaceTheme hoverModifier
				ifNil: [[:c | c adjustBrightness: -0.1]])
				value: offColor.
	feedbackColor := (self userInterfaceTheme feedbackModifier
				ifNil: [[:c | c adjustBrightness: -0.3]])
				value: offColor.
	self updateFillStyle