primitives-adding
primAddGradientFill: colorRamp from: origin along: direction normal: normal radial: isRadial 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddGradientFill: colorRamp
				from: origin
				along: direction
				normal: normal
				radial: isRadial].
	^ self primitiveFailed