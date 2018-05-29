process specific
environmentAt: key ifAbsentPut: aBlock
	"GsSqueak does not support having more than one Environment"
	
	^ Smalltalk globals at: key ifAbsentPut: aBlock.
