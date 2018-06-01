displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox: clipRect rule: anInteger fillColor: aForm 
	"Get the scaled and translated path of newKnots."

	| newKnots newSpline |
	newKnots := aTransformation applyTo: self.
	newSpline := Spline new.
	newKnots do: [:knot | newSpline add: knot].
	newSpline form: self form.
	newSpline
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm