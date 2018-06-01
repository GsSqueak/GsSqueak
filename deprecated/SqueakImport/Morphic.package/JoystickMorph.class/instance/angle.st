accessing
angle

	self center = handleMorph center ifTrue: [^ lastAngle].
	^ 360.0 - (handleMorph center - self center) theta radiansToDegrees