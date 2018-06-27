process specific
environmentAt: key  ifAbsent: aBlock
	
	^(env ifNil: [ ^aBlock value ]) at: key ifAbsent: aBlock.
