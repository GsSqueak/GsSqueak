drawing
labelShrinkThreshold
	"Determines the minimum width for labels not to be shrunk down to
	their first character."
	^ (self font widthOf: $m)
		* 3