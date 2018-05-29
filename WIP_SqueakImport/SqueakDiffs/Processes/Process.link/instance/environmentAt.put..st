process specific
environmentAt: key put: value
	"GsSqueak does not support having more than one Environment"
	^ Smalltalk globals at: key put: value.
