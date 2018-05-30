displaying
displayOn: aDisplayMedium transformation: displayTransformation clippingBox: clipRectangle rule: ruleInteger fillColor: aForm 
	"Displays this path, translated and scaled by aTransformation. Get the
	scaled and translated Path."

	| newPath transformedPath |
	transformedPath := displayTransformation applyTo: self.
	newPath := Path new.
	transformedPath do: [:point | newPath add: point].
	newPath form: self form.
	newPath
		displayOn: aDisplayMedium
		at: 0 @ 0
		clippingBox: clipRectangle
		rule: ruleInteger
		fillColor: aForm