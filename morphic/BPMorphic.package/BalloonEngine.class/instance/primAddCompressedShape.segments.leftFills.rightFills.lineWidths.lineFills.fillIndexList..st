primitives-adding
primAddCompressedShape: points segments: nSegments leftFills: leftFills rightFills: rightFills lineWidths: lineWidths lineFills: lineFills fillIndexList: fillIndexList 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddCompressedShape: points
				segments: nSegments
				leftFills: leftFills
				rightFills: rightFills
				lineWidths: lineWidths
				lineFills: lineFills
				fillIndexList: fillIndexList].
	^ self primitiveFailed