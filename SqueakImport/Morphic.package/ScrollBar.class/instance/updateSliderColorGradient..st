updating
updateSliderColorGradient: aColor

	| gradient cc |
	pagingArea color: ((self userInterfaceTheme pagingAreaColorModifier
		ifNil: [ [:c | c darker alpha: 0.35] ]) value: aColor).
	slider borderColor: ((self userInterfaceTheme borderColorModifier
		ifNil: [ [:c | c adjustBrightness: -0.3] ]) value: aColor).
	
	cc := ((self userInterfaceTheme thumbColorModifier
		ifNil: [ [:c | c] ]) value: aColor).
	
	gradient := GradientFillStyle ramp: {
		0.0 -> Color white.
		0.1-> (cc adjustBrightness: 0.05).
		0.6 -> (cc darker)}.
	
	"Fill the thumb"
	gradient origin: slider topLeft.
	gradient direction: (self orientation == #horizontal
		ifTrue:[0@slider height]
		ifFalse:[slider width@0]).
	slider fillStyle: gradient.
	
	"Fill the buttons"
	{self menuButton. self upButton. self downButton} do: [:ea |
		gradient := gradient copy.
		gradient origin: ea topLeft.
		gradient direction: (self orientation == #horizontal
			ifTrue:[0@ea height]
			ifFalse:[ea width@0]).
		ea
			fillStyle: gradient;
			borderWidth: slider borderWidth;
			borderColor: slider borderColor].