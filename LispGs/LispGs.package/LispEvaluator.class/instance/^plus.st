LISP-primitives
+ aConsCell 
	"(+ &rest NUMBERS)
	Return the sum of any number of NUMBERS, even 0"
	| sum |
	sum := 0.
	(aConsCell
		ifNil: [^ 0])
		do: [:each | 
			(each isNumber
					or: [each isComplex])
				ifFalse: [self lispError: 'Number expected'].
			sum := sum + each].
	^ sum
