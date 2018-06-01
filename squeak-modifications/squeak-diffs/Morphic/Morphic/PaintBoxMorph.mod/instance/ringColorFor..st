actions
ringColorFor: aColor
	"Choose a color that contrasts with my current color. If that color isn't redish, return red. Otherwise, return green"

	aColor isTransparent ifTrue: [^ Color red].
	aColor red < 0.5 ifTrue: [^ Color red].
	aColor red > (aColor green + (aColor blue * 0.5))
		ifTrue: [^ Color green]
		ifFalse: [^ Color red].
