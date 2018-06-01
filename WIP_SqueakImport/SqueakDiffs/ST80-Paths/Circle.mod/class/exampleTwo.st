examples
exampleTwo
	"Designate a rectangular area that should be used as the brush for
	displaying the circle. Click any button at a point on the screen which
	will be the center location for the circle. The curve will be displayed
	with a long black form."

	| aCircle aForm |
	aForm := Form fromUser.
	aCircle := Circle new.
	aCircle form: aForm.
	aCircle radius: 150.
	aCircle center: Sensor waitButton.
	aCircle displayOn: Display at: 0 @ 0 rule: Form reverse
 
	 "Circle exampleTwo"