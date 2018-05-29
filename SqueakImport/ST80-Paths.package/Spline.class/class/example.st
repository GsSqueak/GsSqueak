examples
example
	"Designate points on the Path by clicking the red button. Terminate by
	pressing any other button. A curve will be displayed, through the
	selected points, using a long black form."

	| splineCurve aForm flag|
	aForm := Form extent: 2@2.
	aForm  fillBlack.
	splineCurve := Spline new.
	splineCurve form: aForm.
	flag := true.
	[flag] whileTrue:
		[Sensor waitButton.
		 Sensor redButtonPressed
			ifTrue: 
				[splineCurve add: Sensor waitButton. 
				 Sensor waitNoButton.
				 aForm displayOn: Display at: splineCurve last]
			ifFalse: [flag:=false]].
	splineCurve computeCurve.
	splineCurve isEmpty 
		ifFalse: [splineCurve displayOn: Display.
				Sensor waitNoButton].
 
	"Spline example"