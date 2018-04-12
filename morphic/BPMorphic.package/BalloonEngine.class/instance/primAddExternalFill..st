primitives-adding
primAddExternalFill: index 
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self primAddExternalFill: index].
	^ self primitiveFailed