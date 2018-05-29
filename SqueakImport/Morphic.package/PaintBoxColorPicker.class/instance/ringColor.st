drawing
ringColor
	"Choose a color that contrasts with my current color. If that color isn't redish, return red. Otherwise, return green"

	currentColor isTransparent ifTrue: [^ Color red].
	currentColor red < 0.5 ifTrue: [^ Color red].
	currentColor red > (currentColor green + (currentColor blue * 0.5))
		ifTrue: [^ Color green]
		ifFalse: [^ Color red].
