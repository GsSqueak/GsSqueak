examples
exampleSpaceFill
	"Form exampleSpaceFill"
	"This example demonstrates the area filling algorithm. Starts by having
	the user sketch on the screen (ended by option-click) and then select
	a rectangular
	area of the screen which includes all of the area to be filled. Finally,
	(with crosshair cursor), the user points at the interior of some region
	to be
	filled, and the filling begins with that place as its seed."
	| f r interiorPoint |
	Form exampleSketch.
	"sketch a little area with an enclosed region"
	r := Rectangle fromUser.
	f := Form fromDisplay: r.
	interiorPoint := Cursor crossHair
				showWhile: [Sensor waitButton - r origin].
	Cursor execute
		showWhile: [f shapeFill: Color gray interiorPoint: interiorPoint].
	f displayOn: Display at: r origin