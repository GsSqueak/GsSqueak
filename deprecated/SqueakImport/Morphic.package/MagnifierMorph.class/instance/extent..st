geometry
extent: aPoint
	"Round to multiples of magnification"
	srcExtent := (aPoint - (2 * borderWidth)) // magnification.
	^super extent: self defaultExtent