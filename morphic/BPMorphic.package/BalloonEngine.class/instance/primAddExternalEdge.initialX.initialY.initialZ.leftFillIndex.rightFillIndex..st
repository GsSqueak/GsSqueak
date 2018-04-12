primitives-adding
primAddExternalEdge: index initialX: initialX initialY: initialY initialZ: initialZ leftFillIndex: leftFillIndex rightFillIndex: rightFillIndex 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self
				primAddExternalEdge: index
				initialX: initialX
				initialY: initialY
				initialZ: initialZ
				leftFillIndex: leftFillIndex
				rightFillIndex: rightFillIndex].
	^ self primitiveFailed