LISP-primitives
- aConsCell 
	"(- NUMBER &rest MORE-NUMBERS)
	Negate number or subtract numbers.
	With one arg, negates it. With more than one arg, subtracts all but
	the first from the first."
	| x |
	aConsCell ifNil: [self lispError: 'At least one argument expected'].
	x := aConsCell car.
	(aConsCell cdr
		ifNil: [^ x negated])
		do: [:each | 
			(each isNumber
					or: [each isComplex])
				ifFalse: [self lispError: 'Number expected'].
			x := x - each].
	^ x
