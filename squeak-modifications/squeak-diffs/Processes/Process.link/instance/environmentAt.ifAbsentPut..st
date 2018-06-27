process specific
environmentAt: key ifAbsentPut: aBlock
	"GsSqueak does not support having more than one Environment"
	
	^(env ifNil: [ env := Dictionary new ]) at: key ifAbsentPut: aBlock.
