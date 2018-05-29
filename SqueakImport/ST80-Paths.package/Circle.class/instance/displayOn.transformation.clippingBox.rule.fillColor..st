displaying
displayOn: aDisplayMedium transformation: aTransformation clippingBox: clipRect rule: anInteger fillColor: aForm

	1 to: 4 do:
		[:i |
		super quadrant: i.
		super displayOn: aDisplayMedium
			transformation: aTransformation
			clippingBox: clipRect
			rule: anInteger
			fillColor: aForm]