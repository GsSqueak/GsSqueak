framing
scaleFactor
	"Use the default font height to calculate some factor. Better than
	nothing... "
	^ TextStyle defaultFont height / 14
		* (Preferences bigDisplay
				ifTrue: ["reference value"
					1.75]
				ifFalse: [1.0])