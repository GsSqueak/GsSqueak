displaying
displayOn: aDisplayMedium at: aPoint clippingBox: clipRect rule: anInteger fillColor: aForm 
	"Display the receiver, a spline curve, approximated by straight line
	segments."

	| n line t x y x1 x2 x3 y1 y2 y3 |
	collectionOfPoints size < 1 ifTrue: [self error: 'a spline must have at least one point'].
	line := Line new.
	line form: self form.
	line beginPoint: 
		(x := (coefficients at: 1) at: 1) rounded @ (y := (coefficients at: 5) at: 1) rounded.
	1 to: (coefficients at: 1) size - 1 do: 
		[:i | 
		"taylor series coefficients"
		x1 := (coefficients at: 2) at: i.
		y1 := (coefficients at: 6) at: i.
		x2 := ((coefficients at: 3) at: i) / 2.0.
		y2 := ((coefficients at: 7) at: i) / 2.0.
		x3 := ((coefficients at: 4) at: i) / 6.0.
		y3 := ((coefficients at: 8) at: i) / 6.0.
		"guess n"
		n := 5 max: (x2 abs + y2 abs * 2.0 + ((coefficients at: 3)
							at: i + 1) abs + ((coefficients at: 7)
							at: i + 1) abs / 100.0) rounded.
		1 to: n - 1 do: 
			[:j | 
			t := j asFloat / n.
			line endPoint: 
				(x3 * t + x2 * t + x1 * t + x) rounded 
							@ (y3 * t + y2 * t + y1 * t + y) rounded.
			line
				displayOn: aDisplayMedium
				at: aPoint
				clippingBox: clipRect
				rule: anInteger
				fillColor: aForm.
			line beginPoint: line endPoint].
		line beginPoint: 
				(x := (coefficients at: 1) at: i + 1) rounded 
					@ (y := (coefficients at: 5) at: i + 1) rounded.
		line
			displayOn: aDisplayMedium
			at: aPoint
			clippingBox: clipRect
			rule: anInteger
			fillColor: aForm]