updating
setTime: aTime

	needleMorph rotationDegrees: aTime minutes * 6 + (aTime seconds / 10).
	hourHandMorph rotationDegrees: (aTime hours * 30) + (aTime minutes / 2)