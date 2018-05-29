displaying
displayOn: aDisplayMedium at: aPoint clippingBox: clipRect rule: anInteger fillColor: aForm

	| nSegments line angle sin cos xn yn |
	nSegments := 12.0.
	line := Line new.
	line form: self form.
	angle := (90.0 / nSegments) degreesToRadians.
	sin := angle sin.
	cos := angle cos.
	quadrant = 1
		ifTrue: 
			[xn := radius asFloat.
			yn := 0.0].
	quadrant = 2
		ifTrue: 
			[xn := 0.0.
			yn := 0.0 - radius asFloat].
	quadrant = 3
		ifTrue: 
			[xn := 0.0 - radius asFloat.
			yn := 0.0].
	quadrant = 4
		ifTrue: 
			[xn := 0.0.
			yn := radius asFloat].
	nSegments asInteger
		timesRepeat: 
			[ | xn1 yn1 |
			xn1 := xn * cos + (yn * sin).
			yn1 := yn * cos - (xn * sin).
			line beginPoint: center + (xn asInteger @ yn asInteger).
			line endPoint: center + (xn1 asInteger @ yn1 asInteger).
			line
				displayOn: aDisplayMedium
				at: aPoint
				clippingBox: clipRect
				rule: anInteger
				fillColor: aForm.
			xn := xn1.
			yn := yn1]