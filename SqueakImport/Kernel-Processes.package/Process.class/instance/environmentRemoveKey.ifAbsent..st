process specific
environmentRemoveKey: key ifAbsent: errorBlock
	
	^(env ifNil: [ ^errorBlock value ]) removeKey: key ifAbsent: errorBlock