private - layout
gradientRamp
	| cc |
	cc := originalColor adjustSaturation: -0.08 brightness: 0.4.
	^ gradientRamp ifNil:[gradientRamp := {
			0.0 -> cc. 
			0.25 -> (originalColor mixed: 0.5 with: cc). 
			0.9 -> originalColor.
			1.0 -> originalColor darker.}]