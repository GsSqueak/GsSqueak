instance creation
darkBackgroundForm

	| ref |
	ref := self darkBackground.

	^ (SqueakTheme linenblue  asFormOfDepth: 32) collectColors: [:c | 
		Color
			h:ref hue
			s: ref saturation
			v: c brightness
			alpha: c alpha]