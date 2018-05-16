instance creation
lightBackgroundForm

	| ref |
	ref := self lightBackground.

	^ (SqueakTheme linenblue  asFormOfDepth: 32) collectColors: [:c | 
		Color
			h:ref hue
			s: ref saturation
			v: 0.7 - c brightness
			alpha: c alpha]