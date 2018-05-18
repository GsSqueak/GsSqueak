*Morphic-NewCurves-cubic support
cubicPointPolynomialAt: vIndex
	"From curve information assemble a 4-array of points representing the coefficents for curve segment between to points. Beginning point is first point in array endpoint is the pointSum of the array. Meant to be sent to newcurves idea of curve coefficents." 
	
	| result |
	result := Cubic new: 4.
	1 to: 4 do: [ :i | 
		result at: i put: ((self at: i) at: vIndex) @ ((self at: 4 + i) at: vIndex) ].
	^result