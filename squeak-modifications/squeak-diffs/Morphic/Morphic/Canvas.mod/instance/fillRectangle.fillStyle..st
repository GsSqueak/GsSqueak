drawing-rectangles
fillRectangle: aRectangle fillStyle: aFillStyle
	"Fill the given rectangle.
	Note: The default implementation does not recognize any enhanced fill styles"
	self fillRectangle: aRectangle color: aFillStyle asColor.