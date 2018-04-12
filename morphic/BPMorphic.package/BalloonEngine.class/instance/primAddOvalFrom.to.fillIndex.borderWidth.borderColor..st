primitives-adding
primAddOvalFrom: start to: end fillIndex: fillIndex borderWidth: width borderColor: pixelValue32 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddOvalFrom: start
				to: end
				fillIndex: fillIndex
				borderWidth: width
				borderColor: pixelValue32].
	^ self primitiveFailed