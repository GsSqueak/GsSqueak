displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox: clipRect rule: anInteger fillColor: aForm

	| newPath newLine |
	newPath := aTransformation applyTo: self.
	newLine := Line new.
	newLine beginPoint: newPath firstPoint.
	newLine endPoint: newPath secondPoint.
	newLine form: self form.
	newLine
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm