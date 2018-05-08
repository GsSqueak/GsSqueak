process specific
environmentAt: key ifAbsentPut: aBlock
	
	^(env ifNil: [ env := Dictionary new ]) at: key ifAbsentPut: aBlock.