as yet unclassified
drawOn: aCanvas 
	"Draw a hatch pattern first."
	aCanvas
		fillRectangle: self innerBounds
		fillStyle: (InfiniteForm with: ColorPresenterMorph hatchForm).
	super drawOn: aCanvas