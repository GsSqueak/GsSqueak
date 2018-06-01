primitives-adding
primAddBezierFrom: start to: end via: via leftFillIndex: leftFillIndex rightFillIndex: rightFillIndex 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddBezierFrom: start
				to: end
				via: via
				leftFillIndex: leftFillIndex
				rightFillIndex: rightFillIndex].
	^ self primitiveFailed