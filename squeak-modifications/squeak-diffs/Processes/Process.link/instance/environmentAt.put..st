process specific
environmentAt: key put: value
	
	^(env ifNil: [ env := Dictionary new ]) at: key put: value.
