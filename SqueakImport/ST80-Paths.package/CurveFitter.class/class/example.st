examples
example
	"Designate three locations on the screen by clicking any button. The
	curve determined by the points will be displayed with a long black form."

	| aCurveFitter aForm |  
	aForm := Form extent: 1@30.			"make a long thin Form for display "
	aForm fillBlack.							"turn it black"
	aCurveFitter := CurveFitter new.
	aCurveFitter form: aForm.						"set the form for display"
				"collect three Points and show them on the dispaly"
	aCurveFitter firstPoint: Sensor waitButton. Sensor waitNoButton.
	aForm displayOn: Display at: aCurveFitter firstPoint.
	aCurveFitter secondPoint: Sensor waitButton. Sensor waitNoButton.
	aForm displayOn: Display at: aCurveFitter secondPoint.
	aCurveFitter thirdPoint: Sensor waitButton. Sensor waitNoButton.
	aForm displayOn: Display at: aCurveFitter thirdPoint.

	aCurveFitter displayOn: Display					"display the CurveFitter"

	"CurveFitter example"