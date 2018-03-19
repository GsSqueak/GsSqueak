slot getters/setters
getBorderColor
	"Answer the border color of my costume"
	^ costume renderedMorph borderStyle color
		ifNil: [costume renderedMorph borderStyle baseColor]