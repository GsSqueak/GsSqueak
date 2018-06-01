primitives-adding
primAddPolygon: points segments: nSegments fill: fillStyle lineWidth: lineWidth lineFill: lineFill 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddPolygon: points
				segments: nSegments
				fill: fillStyle
				lineWidth: lineWidth
				lineFill: lineFill].
	^ self primitiveFailed