accessing
target: anObject 
	target := anObject.
	getSelector
		ifNotNil: [floatPrecision := anObject defaultFloatPrecisionFor: getSelector]