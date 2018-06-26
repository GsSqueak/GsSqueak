testing
integerValueOf: oop
	oop isInteger ifFalse:[self error:'Not a SmallInteger'].
	^oop
