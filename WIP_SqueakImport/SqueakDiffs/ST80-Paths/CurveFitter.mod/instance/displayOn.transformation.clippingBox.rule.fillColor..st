displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox: clipRect rule: anInteger fillColor: aForm

	| transformedPath newCurveFitter |
	transformedPath := aTransformation applyTo: self.
	newCurveFitter := CurveFitter new.
	newCurveFitter firstPoint: transformedPath firstPoint.
	newCurveFitter secondPoint: transformedPath secondPoint.
	newCurveFitter thirdPoint: transformedPath thirdPoint.
	newCurveFitter form: self form.
	newCurveFitter
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm