displaying
displayOn: aDisplayMedium at: aPoint clippingBox: clipRect rule: anInteger fillColor: aForm

	1 to: 4 do:
		[:i |
		super quadrant: i.
		super displayOn: aDisplayMedium
			at: aPoint
			clippingBox: clipRect
			rule: anInteger
			fillColor: aForm]