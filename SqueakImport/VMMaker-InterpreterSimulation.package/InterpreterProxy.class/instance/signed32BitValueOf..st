converting
signed32BitValueOf: oop
	oop isInteger ifFalse:[self error:'Not an integer object'].
	^oop