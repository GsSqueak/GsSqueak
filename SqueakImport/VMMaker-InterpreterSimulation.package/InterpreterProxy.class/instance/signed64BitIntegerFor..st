converting
signed64BitIntegerFor: integerValue
	integerValue isInteger ifFalse:[self error:'Not an Integer object'].
	^integerValue