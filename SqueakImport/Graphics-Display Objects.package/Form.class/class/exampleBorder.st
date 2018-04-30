examples
exampleBorder    "Form exampleBorder"
	"This example demonstrates the border finding algorithm. Start
	by having the user sketch on the screen (end with option-click) and then select a rectangular
	area of the screen which includes all of the area to be filled. Finally,
	(with crosshair cursor), the user points at the interior of the region to be
	outlined, and the region begins with that place as its seed."
	| f r interiorPoint |
	Form exampleSketch.		"sketch a little area with an enclosed region"
	r := Rectangle fromUser.
	f := Form fromDisplay: r.
	interiorPoint := Cursor crossHair showWhile:
		[Sensor waitButton - r origin].
	Cursor execute showWhile:
		[f shapeBorder: Color blue width: 2 interiorPoint: interiorPoint
			sharpCorners: false internal: false].
	f displayOn: Display at: r origin	