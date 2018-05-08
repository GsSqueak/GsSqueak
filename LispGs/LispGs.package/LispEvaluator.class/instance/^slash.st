LISP-primitives
/ aConsCell 
	"(/ DIVIDEND DIVISOR &rest MORE-DIVISORS)
	Returns first argument divided by all the remaining arguments. 
	All arguments must be numbers"
	| x |
	aConsCell
		ifNil: [self lispError: 'At least one argument expected'].
	x := aConsCell car.
	(aConsCell cdr
		ifNil: [^ 1 / x])
		do: [:each | 
			(each isNumber
					or: [each isComplex])
				ifFalse: [self lispError: 'Number expected'].
			x := x / each].
	^ x
