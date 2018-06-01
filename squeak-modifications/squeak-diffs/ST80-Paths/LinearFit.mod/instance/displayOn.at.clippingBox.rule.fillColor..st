displaying
displayOn: aDisplayMedium at: aPoint clippingBox: clipRect rule: anInteger
fillColor: aForm
 
	| line |
	line := Line new.
	line form: self form.
	1 to: self size - 1 do: 
		[:i | 
		line beginPoint: (self at: i).
		line endPoint: (self at: i + 1).
		line displayOn: aDisplayMedium
			at: aPoint
			clippingBox: clipRect
			rule: anInteger
			fillColor: aForm]