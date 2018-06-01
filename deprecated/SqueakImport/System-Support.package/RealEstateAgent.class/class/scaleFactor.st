framing
scaleFactor
	"Use the default font height to calculate some factor. Better than nothing..."
	
	^ (TextStyle defaultFont height / 14 "reference value") * (Preferences bigDisplay ifTrue: [1.75] ifFalse: [1.0])