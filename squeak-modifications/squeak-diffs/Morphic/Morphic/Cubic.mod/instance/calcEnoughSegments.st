cubic support
calcEnoughSegments
	"Find the power of two that represents a sufficient number of  
	segments for this cubic.  
	The measure is the sum of distances for the segments.  
	We want this to be close enough not affect the straightness of  
	the drawn lines. Which means within one pixel."
	"^ self 
	enough: 2 
	withMeasure: (self measureFor: 1) 
	withIn: self leeway 
	This ran into a problem when the curve was an s-curve with 
	inflections. Besides honeIn will check to see if 1 is better than 
	two so we lose nothing by starting a little higher."
	^ self
		enough: 4
		withMeasure: (self measureFor: 2)
		withIn: self leeway