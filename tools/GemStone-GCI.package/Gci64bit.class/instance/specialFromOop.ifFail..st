oop access
specialFromOop: anOop ifFail: failBlock

	| classField data |
	classField := anOop bitAnd: 16rF8.
	data := anOop >> 8.
	classField = self specialClassFieldBoolean ifTrue: [^ data = 1].
	classField = self specialClassFieldUndefinedObject ifTrue: [^ nil].
	classField = self specialClassFieldCharacter ifTrue: [^ Character value: data].
	classField = self specialClassFieldSmallFraction ifTrue: [
		| numerator denominator |
		denominator := data bitAnd: 16r7FFFFFF. "27bit unsigned numerator"
		numerator := (data >> 27) bitAnd: 16r1FFFFFFF. "29bit signed numerator"
		numerator := numerator asSigned: 29.
		^ Fraction numerator: numerator denominator: denominator].
	^ failBlock value