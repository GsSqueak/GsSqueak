examples
example
	"Click the button somewhere on the screen. The designated point will
	be the center of an Arc with radius 50 in the 4th quadrant."

	| anArc aForm |
	aForm := Form extent: 1 @ 30.	"make a long thin Form for display"
	aForm fillBlack.						"turn it black"
	anArc := Arc new.
	anArc form: aForm.					"set the form for display"
	anArc radius: 50.0.
	anArc center: Sensor waitButton.
	anArc quadrant: 4.
	anArc displayOn: Display.
	Sensor waitButton

	"Arc example"