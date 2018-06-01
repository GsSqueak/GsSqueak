displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox:
clipRect rule: anInteger fillColor: aForm 

	| transformedPath |
	"get the scaled and translated Path."
	transformedPath := aTransformation applyTo: self.
	transformedPath
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm