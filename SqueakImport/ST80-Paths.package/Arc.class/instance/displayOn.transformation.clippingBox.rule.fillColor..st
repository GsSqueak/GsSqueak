displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox: clipRect rule: anInteger fillColor: aForm

	| newArc tempCenter |
	newArc := Arc new.
	tempCenter := aTransformation applyTo: self center.
	newArc center: tempCenter x asInteger @ tempCenter y asInteger.
	newArc quadrant: self quadrant.
	newArc radius: (self radius * aTransformation scale x) asInteger.
	newArc form: self form.
	newArc
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm