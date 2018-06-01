examples
example
	"Select points on a Path using the red button. Terminate by selecting
	any other button. Creates a Path from the points and displays it as a
	piece-wise linear approximation." 

	| aLinearFit aForm flag |
	aLinearFit := LinearFit new.
	aForm := Form extent: 1 @ 40.
	aForm  fillBlack.
	aLinearFit form: aForm.
	flag := true.
	[flag] whileTrue:
		[Sensor waitButton.
		 Sensor redButtonPressed
			ifTrue: [aLinearFit add: Sensor waitButton. Sensor waitNoButton.
					aForm displayOn: Display at: aLinearFit last]
			ifFalse: [flag:=false]].
	aLinearFit displayOn: Display

	"LinearFit example"