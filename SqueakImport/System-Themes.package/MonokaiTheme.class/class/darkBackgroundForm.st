instance creation
darkBackgroundForm

	| ref |
	ref := self backgroundColor.

	^ (SqueakTheme linenblue  asFormOfDepth: 32) collectColors: [:c | 
		Color
			h:ref hue
			s: ref saturation
			v: c brightness - 0.1
			alpha: c alpha]